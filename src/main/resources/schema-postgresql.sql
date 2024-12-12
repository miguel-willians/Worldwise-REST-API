

-- Tabela de cidades
CREATE TABLE if not exists city (
    id SERIAL PRIMARY KEY,                -- ID único para a cidade
    city_name VARCHAR(255) NOT NULL,      -- Nome da cidade
    country VARCHAR(255) NOT NULL,        -- País da cidade
    country_code VARCHAR(10),             -- Emoji representando a bandeira do país
    lat DOUBLE PRECISION NOT NULL,        -- Latitude da posição
    lng DOUBLE PRECISION NOT NULL,        -- Longitude da posição
    notes TEXT,                           -- Notas sobre a cidade
    created_at TIMESTAMP DEFAULT NOW()    -- Data de criação da entrada
);

-- Index para facilitar consultas por nome de cidade
CREATE INDEX idx_city_name ON city (city_name);

-- Index para facilitar consultas por país
CREATE INDEX idx_country ON city (country);
