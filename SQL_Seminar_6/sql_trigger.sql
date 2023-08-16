CREATE OR REPLACE FUNCTION CheckCommunityNameLength()
RETURNS TRIGGER AS $$
BEGIN
    IF LENGTH(NEW.name) < 5 THEN
        RAISE EXCEPTION 'Community name must be at least 5 characters long.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckCommunityNameTrigger
BEFORE INSERT ON communities
FOR EACH ROW
EXECUTE FUNCTION CheckCommunityNameLength();
