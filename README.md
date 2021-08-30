# supabase-roll-your-own-auth
Custom Supabase authentication using PostgreSQL functions

This is a set of PostgreSQL functions that perform customizable Supabase auth functions.

## function: generate_auth_link(payload json)
This is the core function that generates a necessary link for the following purposes:

- invite (used in a user invite email)
- magiclink (used for password-less sign in emails)
- recovery (used for password recovery emails)
- signup (used for confirming email address for email signups)

### generate an invite link
Send a JSON object to the function `private.generate_auth_link` function as follows:

```sql
select private.generate_auth_link(
'{
  "type": "invite",
  "email": "user@host.com",
  "data": { "foo": "bar2" },
  "redirect_to": "http://localhost:3000"
}'
);
```

#### Notes
- according to the docs at [https://github.com/supabase/gotrue#post-admingenerate_link](https://github.com/supabase/gotrue#post-admingenerate_link) the `data` parameter should not work here, but in my tests, it does
- the `redirect_to` parameter can be customized for your application, including a complete path

### generate a magiclink (password-less login)
Send a JSON object to the function `private.generate_auth_link` function as follows:

```sql
select private.generate_auth_link(
'{
  "type": "magiclink",
  "email": "user@host.com",
  "redirect_to": "http://localhost:3000"
}'
);
```

#### Notes
- according to the docs at [https://github.com/supabase/gotrue#post-admingenerate_link](https://github.com/supabase/gotrue#post-admingenerate_link) the `data` parameter should not work here, but in my tests, it does
- the `redirect_to` parameter can be customized for your application, including a complete path

### generate a recovery link (password recovery)
Send a JSON object to the function `private.generate_auth_link` function as follows:

```sql
select private.generate_auth_link(
'{
  "type": "recovery",
  "email": "user@host.com",
  "redirect_to": "http://localhost:3000"
}'
);
```

#### Notes
- the `redirect_to` parameter can be customized for your application, including a complete path

### generate a signup link (email registration)
Send a JSON object to the function `private.generate_auth_link` function as follows:

```sql
select private.generate_auth_link(
'{
  "type": "signup",
  "email": "user@host.com",
  "password": "password123",
  "data": { "foo": "bar2" },
  "redirect_to": "http://localhost:3000"
}'
);
```

#### Notes
- the `redirect_to` parameter can be customized for your application, including a complete path

