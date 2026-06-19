# Backend Exam Cheatsheet

One controller method + matching DAL method = one feature. Everything below is about minimizing how much of that pair you actually have to write from scratch.

---

## 0. Before you touch a single subject

Read the table schema once, then immediately ask:

1. **Is there a comma-list column?** (`memberList`, `documentList`) → you'll need `listToArr`/`addToList` style helpers. They're already in every template.
2. **Is there a prefix/suffix encoded in a name column?** (`"BOOK-Math"`, `"Yoga-Low"`) → `prefix()`/`suffix()` helpers, already in every template.
3. **Does anything need last-insert-id?** → covered per-stack below, don't write a SELECT MAX(id) query, ever.
4. **Is there a date-range overlap check?** → `overlaps()` helper, already in every template. Get the inequality direction right _once_: `!(aEnd <= bStart || aStart >= bEnd)` — write this on scratch paper if you doubt yourself mid-exam, it's the #1 source of off-by-one bugs.

Whichever stack you're in, copy the `Item`/`Items` template, do a project-wide rename, then delete what you don't need rather than building up from blank. Deleting unused boilerplate is faster than typing new boilerplate.

---

## 1. Last-insert-id, per stack

|Stack|How|
|---|---|
|**PHP**|`$this->pdo->lastInsertId()` after `execute()` — already wrapped in `DBUtils::getLastInsertId()`|
|**Node.js**|`const [result] = await pool.execute(INSERT...)` → `result.insertId`|
|**ASP.NET**|Append `; SELECT LAST_INSERT_ID();` to the INSERT command text, then `Convert.ToInt32(cmd.ExecuteScalar())` — **not** `ExecuteNonQuery()`|
|**Spring Boot**|`SimpleJdbcInsert.withTableName(...).usingGeneratedKeyColumns("id").executeAndReturnKey(params)` → `.longValue()`|

ASP.NET is the one most likely to bite you — if you call `ExecuteNonQuery()` on a command that ends in a SELECT, you get nothing back. The `; SELECT LAST_INSERT_ID();` trick must be in the **same command/connection**, you can't open a second connection and expect MySQL's session-scoped `LAST_INSERT_ID()` to still be valid.

---

## 2. Where logic should live

In **every** template here, the rule is the same:

- **DAL = SQL only.** Fetch rows, insert rows, no `if`, no loops over results except the bare while-loop that builds a list.
- **Controller = all logic.** Discount math, overlap checks, category grouping, comma-list manipulation — all of it happens after the DAL call returns plain data.

This isn't a style preference, it's what makes exam time fast: when the spec changes ("oh wait, it's 3+ items not 2+"), you're editing one `if` in the controller, not re-deriving a SQL `HAVING` clause under time pressure.

The one exception: simple `WHERE`/`JOIN` filtering that the DB can do in one shot (e.g. `WHERE userId = ?`) — push that into SQL, it's not "logic," it's a lookup.


## 5. Cascade deletes

Recipe→Steps, Order→OrderItems, Author→Documents-in-a-list — any subject with a parent/child relationship and a delete requirement needs child rows gone first (foreign key) or list-column entries cleaned (comma-list style).

- **FK-based child table:** delete children, then parent, in that order, same transaction/connection if your stack makes that easy. Already in `DeleteCascade`/`deleteCascade` in the ASP.NET and Spring templates — port the same two-statement pattern to PHP/Node if a subject needs it.
- **Comma-list based child reference** (SWE Project, Author/Document style): there's no FK to cascade — you have to scan every row whose list column might contain the deleted id and strip it out. This is O(rows), it's fine, just don't forget it's a separate step from the actual `DELETE`.

## 7. Session-scoped counters / "this session only" tracking

Two different exam patterns look similar but aren't:

- **"Count moved this session"** (Task Management) → a plain int in the session: `session['moveCount']`, increment on every successful action. Resets when the session ends — that's correct, that's the spec.
- **"Cancel everything booked _this session_"** (Flights-Hotels) → you can't assume all DB rows for this user belong to this session, so you need a **list of ids** created this session, not a count. Two ways to track it:
    - Server-side: append to a session-scoped array on every insert (`session['reservationIds'][] = newId`), read it back on cancel-all.
    - Client-side: frontend tracks ids in `sessionStorage` (see `SessionService` in the Angular templates) and POSTs the id list to a `CancelAll`/`DeleteSessionItems` endpoint.Either works — server-side is slightly more "correct" since it survives a page refresh without extra frontend wiring; client-side is faster to write if you're already passing data that way. Don't mix both for the same feature, pick one.

---

## 8. Quick reference — request shape per stack

||Query params|Body|Path param|
|---|---|---|---|
|**PHP**|`$_GET['id']`|`json_decode(file_get_contents('php://input'), true)`|n/a (use query string, simpler)|
|**Node**|`req.query.id`|`req.body` (needs `express.json()` middleware)|`req.params.id` if using `/Items/:id`|
|**ASP.NET**|`[FromQuery] int id`|`[FromBody] Item body`|`[FromRoute]` if route has `{id}`|
|**Spring**|`@RequestParam int id`|`@RequestBody Item body`|`@PathVariable int id`|

Stick to query params for GETs and body for POSTs across all four — it's what every template here does, and it avoids fighting routing config for path variables you don't actually need under exam time pressure.

---

## 9. Don't forget (easy to lose points on)

- **Return the actual inserted/updated id**, not just `{success: true}` — the frontend's confirm page almost always needs it for navigation.
- **Final total without discount** still needs to be in the response if the spec says "display the final total (without discount applied)" — compute _both_ numbers, don't throw the pre-discount one away.
- **Renumbering after delete** (recipe steps) is a controller-side loop over already-fetched rows, not a SQL trick — don't try to write a single UPDATE that renumbers everything, just loop and call your existing `UpdateColumn`.
- **"Warn but still allow"** patterns (diversity warning, intensity balance) — these return `success: true` _with_ a warning message, they're not errors. Don't `400`/`403` them.