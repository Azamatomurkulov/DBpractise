CREATE TABLE public."Customers"
(
    id integer NOT NULL,
    customer_name character varying NOT NULL,
    date_of_birth integer,
    gender character varying NOT NULL,
    phone_number character varying,
    PRIMARY KEY (id)
);

CREATE TABLE public."Sport_section"
(
    id integer NOT NULL,
    section_name character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.coach
(
    id integer NOT NULL,
    coach_name character varying NOT NULL,
    coach_gender character varying,
    sport_section_id integer,
    PRIMARY KEY (id)
);

CREATE TABLE public.visits
(
    id integer NOT NULL,
    customer_id integer,
    visit_time timestamp without time zone,
    coach_id integer,
    PRIMARY KEY (id)
);

alter table coach
    add foreign key (sport_section_id)
        references Sport_section (id);

alter table visits
    add foreign key (coach_id)
        references coach (id);

alter table visits
    add foreign key (customer_id)
        references Customers (id);

select "Customers".customer_name, gym.public."Coach".coach_name, visits.visit_time, public."Sport_section".section_name
from visits
         join "Customers" on visits.customer_id = "Customers".id
         join "Coach" on visits.coach_id = "Coach".id
         join "Sport_section" on "Sport_section".id = "Coach".sport_section_id
order by visits.visit_time desc;