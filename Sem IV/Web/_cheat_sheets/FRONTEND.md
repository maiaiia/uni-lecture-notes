# Frontend Speed Cheatsheet

Copy-paste snippets for the things you rewrite every exam. The goal is to never type these from memory — find the closest one here, paste, rename.

---

## 0. The "rows" question — interfaces, not classes

```ts
// Define once per entity, in models/app.models.ts. Never `extends Row`.
interface Product {
  id: number;
  name: string;
  category: string;
  price: number;
}
```

`Row` in the shared models file is only there so `DataTableComponent` has _some_ type to accept. Anything with an `id` field structurally satisfies it — you never write `Product extends Row`. One interface per entity, reused everywhere that entity flows (service → component → table). Skip the interface entirely for single inline values (a total, a username) — just use the primitive.

---

## 1. Signal-based CRUD list (the 90% case)

```ts
items = signal<Product[]>([]);
loading = signal(false);

load() {
  this.loading.set(true);
  this.api.get<Product[]>('products').subscribe({
    next: rows => { this.items.set(rows); this.loading.set(false); },
    error: _    => this.loading.set(false),
  });
}

add(item: Product) {
  this.items.update(list => [...list, item]);
}

removeById(id: number) {
  this.items.update(list => list.filter(i => i.id !== id));
}

updateById(id: number, patch: Partial<Product>) {
  this.items.update(list => list.map(i => i.id === id ? { ...i, ...patch } : i));
}
```

Never `this.items().push(x)` — signals don't know about in-place mutation, the table won't re-render. Always `.set()` or `.update()`with a new array.

---

## 2. Form submit handler (the other 90% case)

```ts
form: Partial<Product> = {};
notif = signal<Notification | null>(null);
loading = signal(false);

onSubmit() {
  this.loading.set(true);
  this.notif.set(null);
  this.api.post<{ success: boolean; id: number }>('products', this.form).subscribe({
    next: res => {
      this.loading.set(false);
      if (res.success) {
        this.notif.set({ kind: 'success', text: 'Saved.' });
        this.router.navigate(['/dashboard']);
      }
    },
    error: err => {
      this.loading.set(false);
      this.notif.set({ kind: 'error', text: err.error?.message ?? 'Failed.' });
    },
  });
}
```

```html
<label>
  Name
  <input type="text" [(ngModel)]="form.name" />
</label>
<button class="btn btn-primary" (click)="onSubmit()" [disabled]="loading()">
  {{ loading() ? 'Saving…' : 'Save' }}
</button>
```

---

## 3. Passing data between wizard pages

Pick ONE mechanism for the whole exam. Don't mix.

**Option A — SessionService (preferred, survives refresh):**

```ts
// Page 1
this.session.setPending('recipe', { title: this.title, steps: [] });
this.router.navigate(['/step-builder']);

// Page 2
const draft = this.session.getPending<RecipeDraft>('recipe')!;
draft.steps.push(newStep);
this.session.setPending('recipe', draft);

// Page 3 — on success
this.session.clearPending('recipe');
```

**Option B — router state (simpler, dies on refresh, fine for non-resumable flows):**

```ts
// Sending page
this.router.navigate(['/confirm'], { state: { items: this.items() } });

// Receiving page
import { Router } from '@angular/router';
const nav = this.router.getCurrentNavigation(); // only works in constructor
const state = nav?.extras?.state as { items: Product[] } | undefined;
```

If you need it in `ngOnInit` instead of the constructor, grab it via `history.state` instead — `getCurrentNavigation()` is only populated during the navigation itself.

---

## 4. Computed total / discount display

```ts
items = signal<Product[]>([]);

total = computed(() => {
  const list = this.items();
  let sum = list.reduce((s, i) => s + i.price, 0);
  if (list.length >= 3) sum *= 0.90;
  const cats = list.map(i => i.category);
  const hasDup = cats.length !== new Set(cats).size;
  if (hasDup) sum *= 0.95;
  return sum;
});

rawTotal = computed(() => this.items().reduce((s, i) => s + i.price, 0));
```

```html
<p>Total: {{ total() | number:'1.2-2' }}</p>
<p *ngIf="total() !== rawTotal()">(Original: {{ rawTotal() | number:'1.2-2' }})</p>
```

`computed()` re-runs automatically when `items` changes — no manual recalculation calls needed, no `ngOnChanges`.

---

## 5. Conditional banner / warning message

```html
@if (warningText()) {
  <div class="msg msg-warning">{{ warningText() }}</div>
}
```

```ts
warningText = computed(() => {
  const groups = this.steps().flatMap(s => s.ingredients.map(i => i.category));
  if (groups.length === 0) return null;
  const counts = groups.reduce((acc, g) => ({ ...acc, [g]: (acc[g] ?? 0) + 1 }), {} as Record<string, number>);
  const [topGroup, topCount] = Object.entries(counts).sort((a, b) => b[1] - a[1])[0];
  return topCount / groups.length > 0.6 ? `This recipe is heavily ${topGroup} based` : null;
});
```

---

## 6. Two-table picker (available items → selected items)

The recipe/order "pick from a list, build a sub-list" pattern:

```ts
available = signal<Ingredient[]>([]);
selected  = signal<Ingredient[]>([]);

addOne(item: Ingredient) {
  if (!this.selected().some(i => i.id === item.id)) {
    this.selected.update(list => [...list, item]);
  }
}

removeOne(id: number) {
  this.selected.update(list => list.filter(i => i.id !== id));
}
```

```html
<app-data-table [columns]="cols" [rows]="available()"
  [actions]="[{ label: 'Add', handler: addOne.bind(this) }]" />

<app-data-table [columns]="cols" [rows]="selected()"
  [actions]="[{ label: 'Remove', handler: (r) => removeOne(r['id']) }]" />
```

`.bind(this)` only needed when the handler is a class method reference; inline arrow functions like the second example don't need it.

---

## 7. Ordered list with renumber-on-delete

```ts
steps = signal<Step[]>([]);

addStep(step: Omit<Step, 'stepNumber'>) {
  this.steps.update(list => [...list, { ...step, stepNumber: list.length + 1 }]);
}

deleteStep(stepNumber: number) {
  this.steps.update(list =>
    list
      .filter(s => s.stepNumber !== stepNumber)
      .map((s, i) => ({ ...s, stepNumber: i + 1 }))
  );
}
```

One `.filter()` + `.map()` chain, no manual index math, no off-by-one risk.

---

## 8. Route guard reminder

Every protected route needs `canActivate: [authGuard]`. If a page loads but immediately looks empty/broken, check this before debugging the component — it's often just an unauthenticated API call failing silently.

---

## 9. Fast decision table

|You need...|Use|
|---|---|
|A list with action buttons|`<app-data-table>` — never hand-write `<table>`|
|Any inline success/error text|`notif` signal + `.msg .msg-{kind}` class|
|A derived value (total, warning, filtered list)|`computed()` — never a method called from the template|
|Data on the next page|`SessionService.setPending` (resumable) or router `state` (one-shot)|
|A two-list picker|Two signals + add/remove via `.update()`, see §6|
|To check if user is logged in|`authGuard` on the route, not a manual check in `ngOnInit`|

---

## 10. The 3 mistakes that cost the most time

1. **Mutating a signal's array in place** (`.push()`, `.splice()`) instead of `.set()`/`.update()` with a new array — UI silently doesn't update, you'll waste 10 minutes thinking the bug is elsewhere.
2. **Mixing data-passing mechanisms** mid-exam (router state on one page, SessionService on the next) — pick one at the start, write it on paper if you have to, don't relitigate per page.
3. **Styling before functionality works.** Get the ugly version working end-to-end first. Polish, if there's time left, is the last 10 minutes, not interleaved throughout.