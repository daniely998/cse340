-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- ========================================
-- Project Table
-- ========================================
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    project_location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES organization (organization_id)
);

-- BrightFuture Builders projects (organization_id = 1)
INSERT INTO project (organization_id, title, description, project_location, project_date) VALUES
(1, 'Community Center Renovation', 'Renovating an aging community center with sustainable materials.', 'Springfield', '2026-06-15'),
(1, 'Eco-Friendly Playground', 'Building a playground using recycled and eco-safe materials.', 'Riverside Park', '2026-07-10'),
(1, 'Green Roof Initiative', 'Installing green roofs on public buildings to reduce heat and improve air quality.', 'Downtown District', '2026-08-05'),
(1, 'Accessible Housing Project', 'Constructing affordable, accessible housing units for low-income families.', 'Eastside', '2026-09-20'),
(1, 'Solar-Powered Library', 'Upgrading a local library with solar panels and energy-efficient systems.', 'Westbrook', '2026-10-12');

-- GreenHarvest Growers projects (organization_id = 2)
INSERT INTO project (organization_id, title, description, project_location, project_date) VALUES
(2, 'Urban Garden Expansion', 'Expanding community gardens to provide fresh produce to local residents.', 'Midtown', '2026-06-25'),
(2, 'School Farming Program', 'Teaching students about sustainable farming through hands-on garden projects.', 'Lincoln High School', '2026-07-18'),
(2, 'Hydroponics Workshop', 'Hosting workshops on hydroponic farming techniques for urban growers.', 'Community Center', '2026-08-22'),
(2, 'Neighborhood Composting', 'Launching a composting program to reduce waste and enrich soil.', 'Greenfield', '2026-09-14'),
(2, 'Farm-to-Table Fair', 'Organizing a fair to connect local farmers with restaurants and residents.', 'Central Plaza', '2026-10-08');

-- UnityServe Volunteers projects (organization_id = 3)
INSERT INTO project (organization_id, title, description, project_location, project_date) VALUES
(3, 'Charity Food Drive', 'Coordinating volunteers to collect and distribute food to families in need.', 'Community Hall', '2026-06-12'),
(3, 'Park Clean-Up Day', 'Mobilizing volunteers to clean and restore local parks.', 'Maple Park', '2026-07-03'),
(3, 'Senior Support Program', 'Organizing visits and assistance for elderly residents.', 'Sunrise Retirement Home', '2026-08-16'),
(3, 'Youth Mentorship Initiative', 'Pairing volunteers with at-risk youth for guidance and support.', 'Youth Center', '2026-09-09'),
(3, 'Holiday Gift Drive', 'Collecting and distributing gifts for children during the holiday season.', 'City Square', '2026-12-01');

-- ========================================
-- Category Table
-- ========================================
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Junction table for many-to-many relationship
CREATE TABLE project_category (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES project (project_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id)
);

-- Add categories
INSERT INTO category (name) VALUES
('Sustainability'),
('Education'),
('Community Service');

-- Associate projects to categories
INSERT INTO project_category (project_id, category_id) VALUES
(1, 1), (1, 3),
(2, 1),
(3, 1),
(4, 3),
(5, 1),
(6, 1), (6, 3),
(7, 2), (7, 1),
(8, 2),
(9, 1),
(10, 1), (10, 2),
(11, 3),
(12, 3), (12, 1),
(13, 3),
(14, 2), (14, 3),
(15, 3);

SELECT * FROM organization;
SELECT * FROM project;
SELECT * FROM category;
SELECT * FROM project_category;