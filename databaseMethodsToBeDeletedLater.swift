//
//  databaseMethods.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/25/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import Foundation
/*
 https://github.com/stephencelis/SQLite.swift
 https://github.com/stephencelis/SQLite.swift/blob/master/Documentation/Index.md#sqliteswift-documentation
import SQLite

let db = try Connection("path/to/db.sqlite3")

let users = Table("users")
let id = Expression<Int64>("id")
let name = Expression<String?>("name")
let email = Expression<String>("email")

try db.run(users.create { t in
    t.column(id, primaryKey: true)
    t.column(name)
    t.column(email, unique: true)
})
// CREATE TABLE "users" (
//     "id" INTEGER PRIMARY KEY NOT NULL,
//     "name" TEXT,
//     "email" TEXT NOT NULL UNIQUE
// )

let insert = users.insert(name <- "Alice", email <- "alice@mac.com")
let rowid = try db.run(insert)
// INSERT INTO "users" ("name", "email") VALUES ('Alice', 'alice@mac.com')

for user in try db.prepare(users) {
    print("id: \(user[id]), name: \(user[name]), email: \(user[email])")
    // id: 1, name: Optional("Alice"), email: alice@mac.com
}
// SELECT * FROM "users"

let alice = users.filter(id == rowid)

try db.run(alice.update(email <- email.replace("mac.com", with: "me.com")))
// UPDATE "users" SET "email" = replace("email", 'mac.com', 'me.com')
// WHERE ("id" = 1)

try db.run(alice.delete())
// DELETE FROM "users" WHERE ("id" = 1)

db.scalar(users.count) // 0
// SELECT count(*) FROM "users"
SQLite.swift also works as a lightweight, Swift-friendly wrapper over the C API.

let stmt = try db.prepare("INSERT INTO users (email) VALUES (?)")
for email in ["betty@icloud.com", "cathy@icloud.com"] {
    try stmt.run(email)
}

db.totalChanges    // 3
db.changes         // 1
db.lastInsertRowid // 3

for row in try db.prepare("SELECT id, email FROM users") {
    print("id: \(row[0]), email: \(row[1])")
    // id: Optional(2), email: Optional("betty@icloud.com")
    // id: Optional(3), email: Optional("cathy@icloud.com")
}

db.scalar("SELECT count(*) FROM users") // 2
*/
