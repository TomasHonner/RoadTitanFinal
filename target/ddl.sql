
    alter table app_users 
        drop constraint if exists FK_6p82nq6vm9cjrtg2mpanleldv;

    alter table app_users 
        drop constraint if exists FK_a4pcb7m0pmgn52d3i3fy2pot6;

    alter table cars 
        drop constraint if exists FK_8rwbrg3yo01p7gsc8em1m6txq;

    alter table cars 
        drop constraint if exists FK_jtjtrkei21u0slocrpd3rvlon;

    alter table locations 
        drop constraint if exists FK_gncc1gccgn1p2dl5vvdsp4x2u;

    alter table logbooks 
        drop constraint if exists FK_8jqeq0se4r44untcy0jie5q8w;

    alter table logbooks_trips 
        drop constraint if exists FK_8soux3mk5lc41gh7304g1237i;

    alter table logbooks_trips 
        drop constraint if exists FK_8xs05gl03h4hp3ujr4qcy73d9;

    alter table reservations 
        drop constraint if exists FK_sil3tag2t26k8tgujq349a6yn;

    alter table reservations 
        drop constraint if exists FK_b9bo4pm7mhc8k2bgvxtijr1n6;

    alter table reservations 
        drop constraint if exists FK_mts1t25y0gwr0c5jy8b2t61hk;

    alter table sec_user_sec_role 
        drop constraint if exists FK_f1eew3u65ajs3e50xvacwgron;

    alter table sec_user_sec_role 
        drop constraint if exists FK_bshvqhdx8h9mb4rrbo1ahnp7q;

    alter table trackers 
        drop constraint if exists FK_cb4yr9g6ccrhmaiwryyfmjv3q;

    alter table trips 
        drop constraint if exists FK_eph5gxw4wnk5lvcaqdhxeso6u;

    alter table trips 
        drop constraint if exists FK_qv2fgbwjdyhurmehc7yno91uc;

    alter table trips 
        drop constraint if exists FK_rvd5t7yvlwr6spacoe2f8jy5l;

    drop table app_users cascade;

    drop table cars cascade;

    drop table companies cascade;

    drop table locations cascade;

    drop table logbooks cascade;

    drop table logbooks_trips cascade;

    drop table reservations cascade;

    drop table sec_role cascade;

    drop table sec_user cascade;

    drop table sec_user_sec_role cascade;

    drop table trackers cascade;

    drop table trips cascade;

    drop sequence hibernate_sequence;

    create table app_users (
        id int8 not null,
        version int8 not null,
        app_user_address varchar(255),
        app_user_email varchar(255) not null,
        app_user_name varchar(255) not null,
        app_user_password varchar(255) not null,
        company_id int8 not null,
        date_created timestamp,
        last_updated timestamp,
        sec_user_id int8,
        primary key (id)
    );

    create table cars (
        id int8 not null,
        version int8 not null,
        car_type varchar(255),
        car_name varchar(255),
        car_registration_number varchar(255),
        company_id int8,
        date_created timestamp,
        last_updated timestamp,
        tracker_id int8 not null,
        primary key (id)
    );

    create table companies (
        id int8 not null,
        version int8 not null,
        company_address varchar(255),
        company_code varchar(255),
        company_name varchar(255) not null,
        date_created timestamp,
        last_updated timestamp,
        primary key (id)
    );

    create table locations (
        id int8 not null,
        version int8 not null,
        date_created timestamp,
        last_updated timestamp,
        latitude float8 not null,
        longitude float8 not null,
        timestamp timestamp not null,
        trip_id int8,
        primary key (id)
    );

    create table logbooks (
        id int8 not null,
        version int8 not null,
        tracker_id int8 not null,
        primary key (id)
    );

    create table logbooks_trips (
        log_book_trips_id int8,
        trip_id int8
    );

    create table reservations (
        id int8 not null,
        version int8 not null,
        app_user_id int8,
        company_id int8,
        date_created timestamp,
        last_updated timestamp,
        reservation_driver_name varchar(255),
        reservation_end_date timestamp,
        reservation_end_location varchar(255),
        reservation_name varchar(255) not null,
        reservation_rejection_reason varchar(255),
        reservation_start_date timestamp,
        reservation_start_location varchar(255),
        reservation_state varchar(255),
        reservation_way_of_financing varchar(255),
        reserved_car_id int8 not null,
        primary key (id)
    );

    create table sec_role (
        id int8 not null,
        version int8 not null,
        authority varchar(255) not null,
        primary key (id)
    );

    create table sec_user (
        id int8 not null,
        version int8 not null,
        account_expired boolean not null,
        account_locked boolean not null,
        enabled boolean not null,
        "password" varchar(255) not null,
        password_expired boolean not null,
        username varchar(255) not null,
        primary key (id)
    );

    create table sec_user_sec_role (
        sec_user_id int8 not null,
        sec_role_id int8 not null,
        primary key (sec_user_id, sec_role_id)
    );

    create table trackers (
        id int8 not null,
        version int8 not null,
        company_id int8,
        date_created timestamp,
        last_updated timestamp,
        tracker_assigned boolean not null,
        tracker_gsm_mode varchar(255),
        tracker_imei varchar(255),
        tracker_name varchar(255),
        tracker_number int4,
        primary key (id)
    );

    create table trips (
        id int8 not null,
        version int8 not null,
        app_user_id int8 not null,
        date_created timestamp,
        last_updated timestamp,
        reservation_id int8 not null,
        tracker_id int8 not null,
        trip_authorized boolean not null,
        trip_end_date_time timestamp,
        trip_length int4,
        trip_start_date_time timestamp,
        primary key (id)
    );

    alter table app_users 
        add constraint UK_6d6rupx6uj4uwj73y5lqxm8h6  unique (app_user_name);

    alter table cars 
        add constraint UK_igb1mrxvjge467y1miii74c9w  unique (car_registration_number);

    alter table logbooks 
        add constraint UK_8jqeq0se4r44untcy0jie5q8w  unique (tracker_id);

    alter table sec_role 
        add constraint UK_oah023x2ltqw09mdue7w0mcxb  unique (authority);

    alter table sec_user 
        add constraint UK_5ctbdrlf3eismye20vsdtk8w8  unique (username);

    alter table trackers 
        add constraint UK_71m0b4gv0d5f7w8c8t8fk6msq  unique (tracker_imei);

    alter table trackers 
        add constraint UK_diydyi288cevf07o3mxslm1fy  unique (tracker_number);

    alter table app_users 
        add constraint FK_6p82nq6vm9cjrtg2mpanleldv 
        foreign key (company_id) 
        references companies;

    alter table app_users 
        add constraint FK_a4pcb7m0pmgn52d3i3fy2pot6 
        foreign key (sec_user_id) 
        references sec_user;

    alter table cars 
        add constraint FK_8rwbrg3yo01p7gsc8em1m6txq 
        foreign key (company_id) 
        references companies;

    alter table cars 
        add constraint FK_jtjtrkei21u0slocrpd3rvlon 
        foreign key (tracker_id) 
        references trackers;

    alter table locations 
        add constraint FK_gncc1gccgn1p2dl5vvdsp4x2u 
        foreign key (trip_id) 
        references trips;

    alter table logbooks 
        add constraint FK_8jqeq0se4r44untcy0jie5q8w 
        foreign key (tracker_id) 
        references trackers;

    alter table logbooks_trips 
        add constraint FK_8soux3mk5lc41gh7304g1237i 
        foreign key (trip_id) 
        references trips;

    alter table logbooks_trips 
        add constraint FK_8xs05gl03h4hp3ujr4qcy73d9 
        foreign key (log_book_trips_id) 
        references logbooks;

    alter table reservations 
        add constraint FK_sil3tag2t26k8tgujq349a6yn 
        foreign key (app_user_id) 
        references app_users;

    alter table reservations 
        add constraint FK_b9bo4pm7mhc8k2bgvxtijr1n6 
        foreign key (company_id) 
        references companies;

    alter table reservations 
        add constraint FK_mts1t25y0gwr0c5jy8b2t61hk 
        foreign key (reserved_car_id) 
        references cars;

    alter table sec_user_sec_role 
        add constraint FK_f1eew3u65ajs3e50xvacwgron 
        foreign key (sec_user_id) 
        references sec_user;

    alter table sec_user_sec_role 
        add constraint FK_bshvqhdx8h9mb4rrbo1ahnp7q 
        foreign key (sec_role_id) 
        references sec_role;

    alter table trackers 
        add constraint FK_cb4yr9g6ccrhmaiwryyfmjv3q 
        foreign key (company_id) 
        references companies;

    alter table trips 
        add constraint FK_eph5gxw4wnk5lvcaqdhxeso6u 
        foreign key (app_user_id) 
        references app_users;

    alter table trips 
        add constraint FK_qv2fgbwjdyhurmehc7yno91uc 
        foreign key (reservation_id) 
        references reservations;

    alter table trips 
        add constraint FK_rvd5t7yvlwr6spacoe2f8jy5l 
        foreign key (tracker_id) 
        references trackers;

    create sequence hibernate_sequence;
