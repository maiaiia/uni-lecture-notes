# Language Syntax Cheatsheet — PHP / Node.js / C# / Java

Side-by-side so you can context-switch between exam subjects without
mixing up syntax. Only what actually comes up in these CRUD-style exams.

---

## 1. Variables & types

| | PHP | Node.js (JS) | C# (ASP.NET) | Java (Spring) |
|---|---|---|---|---|
| Declare | `$x = 5;` | `let x = 5` / `const x = 5` | `var x = 5;` or `int x = 5;` | `var x = 5;` or `int x = 5;` |
| String | `$s = "hi $x";` (interpolates) | `` `hi ${x}` `` (template literal) | `$"hi {x}"` (interpolated) | `"hi " + x` (no built-in interpolation pre-Java 21) |
| Null check | `$x ?? 'default'` | `x ?? 'default'` | `x ?? "default"` | `x != null ? x : "default"` |
| Type is dynamic? | Yes | Yes | No (statically typed) | No (statically typed) |
| Cast to int | `(int)$x` | `parseInt(x)` | `(int)x` or `Convert.ToInt32(x)` | `(int)x` or `Integer.parseInt(x)` |
| Cast to double | `(float)$x` | `parseFloat(x)` | `(double)x` | `Double.parseDouble(x)` |

**Gotcha:** PHP and JS both silently coerce types in comparisons. Always use
`\===`/`!\==` in JS, and prefer `\===` over `\==` in PHP too — `"0" == false` is
true in loose PHP comparison and will bite you in a login check.

---

## 2. Arrays / Lists / Collections

| | PHP | Node.js | C# | Java |
|---|---|---|---|---|
| Declare empty | `$a = [];` | `let a = []` | `var a = new List<Item>();` | `var a = new ArrayList<Item>();` |
| Add item | `$a[] = $x;` | `a.push(x)` | `a.Add(x);` | `a.add(x);` |
| Length | `count($a)` | `a.length` | `a.Count` | `a.size()` |
| Loop | `foreach ($a as $item)` | `for (const item of a)` | `foreach (var item in a)` | `for (var item : a)` |
| Loop w/ index | `foreach ($a as $i => $item)` | `a.forEach((item, i) => ...)` | `for (int i = 0; i < a.Count; i++)` | `for (int i = 0; i < a.size(); i++)` |
| Filter | `array_filter($a, fn($x) => $x > 5)` | `a.filter(x => x > 5)` | `a.Where(x => x > 5)` (needs `using System.Linq;`) | `a.stream().filter(x -> x > 5).collect(Collectors.toList())` |
| Map/transform | `array_map(fn($x) => $x*2, $a)` | `a.map(x => x * 2)` | `a.Select(x => x * 2)` | `a.stream().map(x -> x * 2).collect(Collectors.toList())` |
| Sum | `array_sum($a)` | `a.reduce((s,x)=>s+x, 0)` | `a.Sum(x => x.Price)` | `a.stream().mapToDouble(Item::getPrice).sum()` |
| Contains | `in_array($x, $a)` | `a.includes(x)` | `a.Contains(x)` | `a.contains(x)` |
| First match | `array_filter(...)[0] ?? null` | `a.find(x => ...)` | `a.FirstOrDefault(x => ...)` | `a.stream().filter(...).findFirst().orElse(null)` |
| Group by key | manual loop + assoc array | manual `.reduce()` into object | `a.GroupBy(x => x.Category)` | `a.stream().collect(Collectors.groupingBy(Item::getCategory))` |
| Count distinct values per key | `array_count_values($a)` | manual `.reduce()` | `a.GroupBy(x=>x).ToDictionary(g=>g.Key, g=>g.Count())` | `Collectors.groupingBy(x->x, Collectors.counting())` |
| Join to string | `implode(",", $a)` | `a.join(',')` | `string.Join(",", a)` | `String.join(",", a)` |
| Split string | `explode("-", $s)` | `s.split('-')` | `s.Split('-')` | `s.split("-")` |

**Gotcha (Java streams):** once you `.filter()`/`.map()` a stream, you can't
reuse it — `.collect()` consumes it. If you need the same source list
filtered two different ways, call `.stream()` again from the original list.

**Gotcha (C# LINQ):** `Where`/`Select` are lazy (deferred execution) — if you
mutate the underlying list before enumerating, you can get surprising
results. Call `.ToList()` immediately if you're not sure.

---

## 3. Loops & conditionals

|              | PHP                                                            | Node.js                      | C#                                                | Java                                       |
| ------------ | -------------------------------------------------------------- | ---------------------------- | ------------------------------------------------- | ------------------------------------------ |
| For          | `for ($i=0; $i<10; $i++)`                                      | `for (let i=0; i<10; i++)`   | `for (int i=0; i<10; i++)`                        | `for (int i=0; i<10; i++)`                 |
| While        | `while ($cond) { }`                                            | `while (cond) { }`           | `while (cond) { }`                                | `while (cond) { }`                         |
| Ternary      | `$x > 5 ? 'big' : 'small'`                                     | `x > 5 ? 'big' : 'small'`    | `x > 5 ? "big" : "small"`                         | `x > 5 ? "big" : "small"`                  |
| Switch/match | `match(true) { $x > 5 => 'big', default => 'small' }` (PHP 8+) | `switch (x) { case 5: ... }` | `x switch { > 5 => "big", _ => "small" }` (C# 8+) | `switch (x) { case 5 -> ...; }` (Java 14+) |

---

## 4. Strings

| | PHP | Node.js | C# | Java |
|---|---|---|---|---|
| Concatenate | `$a . $b` | `a + b` or `` `${a}${b}` `` | `a + b` or `$"{a}{b}"` | `a + b` |
| Substring | `substr($s, 0, 3)` | `s.substring(0, 3)` or `s.slice(0,3)` | `s.Substring(0, 3)` | `s.substring(0, 3)` |
| Contains | `str_contains($s, "x")` | `s.includes("x")` | `s.Contains("x")` | `s.contains("x")` |
| Starts with | `str_starts_with($s, "x")` | `s.startsWith("x")` | `s.StartsWith("x")` | `s.startsWith("x")` |
| Trim | `trim($s)` | `s.trim()` | `s.Trim()` | `s.trim()` |
| To upper/lower | `strtoupper($s)` / `strtolower($s)` | `s.toUpperCase()` / `s.toLowerCase()` | `s.ToUpper()` / `s.ToLower()` | `s.toUpperCase()` / `s.toLowerCase()` |
| Empty check | `empty($s)` (also catches "0"!) | `!s || s.length === 0` | `string.IsNullOrEmpty(s)` | `s == null \|\| s.isEmpty()` |

**Gotcha (PHP `empty()`):** `empty("0")` is `true`. If a name/title field is
literally `"0"`, your "required field" check will reject valid input. Prefer
`$s === ''` or `!isset($s)` when you specifically mean "no value entered."

---

## 5. Null / optional handling

| | PHP | Node.js | C# | Java |
|---|---|---|---|---|
| Nullable type | everything's nullable by default | everything's nullable by default | `int?` / `string?` (nullable annotation) | `Integer` (boxed) vs `int` (never null) |
| Null-safe access | `$obj?->prop` | `obj?.prop` | `obj?.Prop` | `Optional.ofNullable(obj).map(...)` or just a null check |
| Default value | `$x ?? 'default'` | `x ?? 'default'` | `x ?? "default"` | `x != null ? x : "default"` |

**Gotcha (Java):** a `HttpSession.getAttribute("id")` returns `Object`, so
you must cast — `(Integer) session.getAttribute("id")` — and that cast
throws if the attribute was never set as an `Integer`. Always null-check
*before* unboxing to `int`, or you'll get a `NullPointerException` on the
auto-unbox, not a clean `null`.

---

## 6. Async / sync model (matters for ordering bugs)

| | Model |
|---|---|
| **PHP** | Synchronous, top to bottom. No `await` needed, no callback hell. |
| **Node.js** | Async by default for I/O (DB calls). Always `await` your `pool.execute()`/`pool.query()` calls or you'll get a Promise object instead of rows, and your code will silently move to the next line before the query finishes. |
| **C# (ASP.NET)** | Sync by default in these templates (`MySqlCommand.ExecuteReader()` is blocking) — fine for exam scale, don't reach for `async`/`await` unless you're already comfortable with it, it adds failure surface for no benefit here. |
| **Java (Spring)** | `JdbcTemplate` calls are synchronous/blocking. No async needed. |

**Gotcha (Node):** forgetting `await` is the #1 silent bug. If a route
returns `undefined` or an empty response with no error, check every
`pool.execute`/`pool.query` call in that route has `await` in front of it.

---

## 7. JSON handling

| | PHP | Node.js | C# | Java |
|---|---|---|---|---|
| Parse request body | `json_decode(file_get_contents('php://input'), true)` | `req.body` (with `express.json()` middleware) | `[FromBody] MyModel body` (auto) | `@RequestBody MyModel body` (auto) |
| Return JSON | `echo json_encode($data);` | `res.json(data)` | `return Json(data);` or `return Ok(data);` | `return ResponseEntity.ok(data);` (auto-serializes) |
| Anonymous object response | `['success' => true]` | `{ success: true }` | `new { success = true }` | `Map.of("success", true)` |

**Gotcha:** PHP's `json_decode(..., true)` — the `true` second argument
matters, it gives you an associative array (`$body['username']`) instead of
a `stdClass` object (`$body->username`). Forgetting it is a common
copy-paste error when the template uses arrays everywhere else.

---

## 8. Object/class basics (when you need a model)

**PHP** — usually skip classes for DTOs, just use associative arrays
returned straight from `$db->query()`.

**Node.js** — same, plain objects, no class needed:
```js
const item = { id: row.id, name: row.name }
```

**C#:**
```csharp
public class Item {
    public int Id { get; set; } = 0;
    public string Name { get; set; } = "";
}
```
`{ get; set; }` is an auto-property — don't write a manual backing field
unless you need custom logic in the getter/setter (you won't, for these
exams).

**Java (with Lombok `@Data`):**
```java
@Data
public class Item {
    public int id;
    public String name;
}
```
`@Data` generates getters/setters/equals/hashCode/toString. Without Lombok
you'd write all of those by hand — check the project already has the Lombok
dependency before assuming `@Data` works.

---

## 9. Common compile/runtime errors and what they actually mean

| Stack | Error | Usually means |
|---|---|---|
| PHP | `Call to a member function on null` | Query returned no rows, you indexed `[0]` on an empty array |
| PHP | `Undefined array key` | Missing field in `$body` — check the frontend is sending it, or use `??` |
| Node | `Cannot read properties of undefined` | Forgot `await`, or DB returned empty `rows[0]` | 
| Node | `ER_BAD_FIELD_ERROR` from mysql2 | Column name typo in raw SQL string |
| C# | `Object reference not set to an instance of an object` | Null reference — usually a DAL method returned `null` and you didn't check before using it |
| C# | `Unable to cast object of type 'System.DBNull'` | Column was NULL in DB, you called `.GetString()` instead of checking `IsDBNull` first — use the `SafeString`/`SafeInt` helpers |
| Java | `NullPointerException` on session attribute | Forgot to null-check before unboxing `Integer` → `int` |
| Java | `IncorrectResultSizeDataAccessException` | `jdbc.queryForObject()` got 0 or 2+ rows when it expected exactly 1 — use `jdbc.query()` (returns a List) and check `.isEmpty()` instead |

---

## 10. Quick "which loop style" decision

- Need to **build a new list** by transforming each item → map/Select/stream().map()
- Need to **keep some, drop others** → filter/Where/stream().filter()
- Need to **mutate something external per item, no return value** → plain foreach
- Need **index AND value** → PHP `foreach ($a as $i => $v)`, JS `a.forEach((v,i)=>)`, C# plain `for`, Java plain `for`

When in doubt during an exam: plain `for`/`foreach` always works and is
never wrong, even if a stream/LINQ one-liner would be "nicer." Don't reach
for the fancy version under time pressure if the imperative loop is what
you'll get right on the first try.