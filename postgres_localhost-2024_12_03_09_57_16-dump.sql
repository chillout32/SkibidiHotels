create sequence clients_id_seq
    as integer;

alter sequence clients_id_seq owner to postgres;

create sequence clients_id_seq1;

alter sequence clients_id_seq1 owner to postgres;

create table clients
(
    id          integer generated always as identity
        constraint clients_pk
            primary key,
    firstname   varchar not null,
    lastname    varchar not null,
    email       varchar not null,
    phonenumber varchar not null,
    dateofbirth date    not null
);

alter table clients
    owner to postgres;

alter sequence clients_id_seq1 owned by clients.id;

create table hotels
(
    hotels_id            integer generated always as identity
        constraint hotels_pk
            primary key,
    hotel_name           varchar          not null,
    phonenumber          varchar          not null,
    email                varchar          not null,
    starsreview          numeric          not null,
    gym                  boolean          not null,
    elevator             boolean          not null,
    distancetobeach      double precision not null,
    distancetocentrum    double precision not null,
    pool                 boolean          not null,
    restaurant           boolean          not null,
    childrensclub        boolean          not null,
    eveningentertainment boolean          not null,
    city                 varchar          not null,
    country              varchar          not null,
    zipcode              varchar          not null,
    adress               varchar          not null
);

alter table hotels
    owner to postgres;

create table roomtypes
(
    roomtypes_id integer not null
        constraint roomtypes_pk
            primary key,
    roomtypename varchar not null
);

alter table roomtypes
    owner to postgres;

create table rooms
(
    rooms_id      integer generated always as identity
        constraint rooms_pk
            primary key,
    roomnumber    varchar not null,
    roomtype      integer not null
        constraint rooms_roomtypes_roomtypes_id_fk
            references roomtypes,
    capacity      integer not null,
    pricepernight integer not null,
    isavailable   boolean not null,
    balcony       boolean not null,
    hotels_id     integer not null
        constraint rooms_hotels_hotels_id_fk
            references hotels
);

alter table rooms
    owner to postgres;

create table bookings
(
    bookings_id  integer generated always as identity
        constraint bookings_pk
            primary key,
    client_id    integer   not null
        constraint bookings_fk
            references clients,
    room_id      integer   not null
        constraint bookings_rooms_rooms_id_fk
            references rooms,
    allinclusive boolean   not null,
    halfpension  boolean   not null,
    extrabed     boolean   not null,
    totalprice   integer   not null,
    checkin      timestamp not null,
    checkout     timestamp not null,
    peopleamount varchar   not null
);

alter table bookings
    owner to postgres;

