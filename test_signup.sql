select private.generate_auth_link(
'{
  "type": "signup",
  "email": "user@host.com",
  "password": "password123",
  "data": { "foo": "bar2" },
  "redirect_to": "http://localhost:3000"
}'
);

/*
body: 
{
  "type": "signup" or "magiclink" or "recovery" or "invite",
  "email": "email@example.com",
  "password": "secret", // only if type = signup
  "data": {
    ...
  }, // only if type = signup
  "redirect_to": "https://supabase.io" // Redirect URL to send the user to after an email action. Defaults to SITE_URL. 

}
*/