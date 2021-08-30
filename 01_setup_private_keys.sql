CREATE SCHEMA IF NOT EXISTS private;
CREATE TABLE IF NOT EXISTS private.keys (
    key text primary key not null,
    value text
);
REVOKE ALL ON TABLE private.keys FROM PUBLIC;

/*******************************************************
*  IMPORTANT:  INSERT YOUR KEYS IN THE COMMANDS BELOW  *
********************************************************

-- [SUPABASE_API_URL]
-- Supabase Dashboard / settings / api / config / url

-- [SUPABASE_SERVICE_KEY]
-- Supabase Dashboard / settings / api / sevice_role (secret)
************************************************************************
*** NOTE: the service_role key is sensitive, DO NOT SHARE IT PUBICLY ***
************************************************************************/

INSERT INTO private.keys (key, value) values ('SUPABASE_API_URL', '[SUPABASE_API_URL]');
INSERT INTO private.keys (key, value) values ('SUPABASE_SERVICE_KEY', '[SUPABASE_SERVICE_KEY]');

