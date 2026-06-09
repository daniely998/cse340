import db from './db.js';

// Link an existing user to a project (volunteer)
const addVolunteer = async (userId, projectId) => {
    const query = `
        INSERT INTO volunteers (user_id, project_id)
        VALUES ($1, $2)
    `;
    await db.query(query, [userId, projectId]);
};

// Unlink a user from a project (withdraw volunteering)
const removeVolunteer = async (userId, projectId) => {
    const query = `
        DELETE FROM volunteers
        WHERE user_id = $1 AND project_id = $2;
    `;
    await db.query(query, [userId, projectId]);
};

// Get all projects a given user has volunteered for
const getUserProjects = async (userId) => {
  const query = `
    SELECT p.title, p.project_id
    FROM volunteers v
    JOIN project p
        ON v.project_id = p.project_id
    WHERE v.user_id = $1
  `;
  const result = await db.query(query, [userId]);
  return result.rows;
};

// Check if user is a volunteer for the project
const checkVolunteer = async (userId, projectId) => {
    const query = `
        SELECT 1
        FROM volunteers
        WHERE user_id = $1 AND project_id = $2
        LIMIT 1;
    `;
    const result = await db.query(query, [userId, projectId]);
    return result.rows.length > 0;
};

export {
    addVolunteer,
    removeVolunteer,
    getUserProjects,
    checkVolunteer
};
