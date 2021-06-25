# `json_truncate`

Simplify JSON object structures for logging purposes. Limit the number of array elements, depth of the tree or length of strings.

```ruby
gem 'json_truncate'
```

```ruby
require 'json_truncate'

person = {
    name: 'John Doe',
    address: {
        street: '123 ABC St.',
        city: 'Truncatia',
    },
    image: '123456789012345678901234567890',
    emails: [ 'jdoe@example.com', 'johnd@example.com', 'john.doe@example.com' ]
}

JsonTruncate.truncate(person,
    max_depth: 1,
    max_string_length: 10,
    max_array_length: 2,
)

# {
#     name: 'John Doe',
#     address: {
#         street: '123 ABC St.',
#         city: 'Truncatia',
#         latlong: [],
#     },
#     image: '12345678901234567890...',
#     emails: [ 'jdoe@example.com', 'johnd@example.com', '...' ]
# }
```

# Options

- `max_depth`: restrict the depth of the tree by pruning arrays and hashes.
- `max_string_length`: restrict the length of strings.
- `max_array_length`: restrict the number of items an array can contain.

All options are optional and can be used together.

# Motivation

There have been occassions where I just want the basics of a JSON structure and
not all the detail. I couldn't find an existing gem to do this so I threw this one
together.
