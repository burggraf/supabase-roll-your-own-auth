drop function if exists private.generate_auth_link;
create extension if not exists http;
create schema if not exists private;
create or replace function private.generate_auth_link(payload json)
    returns json language plpgsql security definer as
$$
declare 
    retval text;
    SUPABASE_API_URL text;
    SUPABASE_SERVICE_KEY text;
begin

    SELECT value::text INTO SUPABASE_API_URL FROM private.keys WHERE key = 'SUPABASE_API_URL';
    IF NOT found THEN RAISE 'missing entry in private.keys: SUPABASE_API_URL'; END IF;

    SELECT value::text INTO SUPABASE_SERVICE_KEY FROM private.keys WHERE key = 'SUPABASE_SERVICE_KEY';
    IF NOT found THEN RAISE 'missing entry in private.keys: SUPABASE_SERVICE_KEY'; END IF;

    SELECT
        content INTO retval
    FROM
        http (('POST', 
        SUPABASE_API_URL || '/auth/v1/admin/generate_link?apikey=' || SUPABASE_SERVICE_KEY,
        ARRAY[http_header ('Authorization', 
        'Bearer ' || SUPABASE_SERVICE_KEY)], 
        'application/json', 
        payload::text
    ));

    return retval;

end;
$$
revoke all on function private.generate_auth_link from public;
