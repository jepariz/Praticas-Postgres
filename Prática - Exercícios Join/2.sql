SELECT t.id AS id, u1.name AS writer, u2.name AS recipient, t.message FROM testimonials t JOIN users u1 ON t."writerId" = u1.id JOIN users u2 ON t."recipientId" = u2.id;

SELECT t.id AS id, u1.name AS writer, u2.name AS recipient, t.message 
FROM testimonials t 
JOIN users u1 
ON t."writerId" = u1.id 
JOIN users u2 
ON t."recipientId" = u2.id;

SELECT u1.id AS id, u2.name AS name, r.name AS role, c.name AS company, e."startDate" AS "startDate" FROM experiences e JOIN users u1 ON e."userId" = u1.id JOIN users u2 ON e."userId" = u2.id JOIN roles r ON e."roleId" = r.id JOIN companies c ON e."companyId" = c.id WHERE e."endDate" IS NULL AND u1.id = 50;