create sequence ix_core_acl_seq start 1 increment 1
create sequence ix_core_backup_seq start 1 increment 1
create sequence ix_core_etag_seq start 1 increment 1
create sequence ix_core_group_seq start 1 increment 1
create sequence ix_core_namespace_seq start 1 increment 1
create sequence ix_core_principal_seq start 1 increment 1
create sequence ix_core_userprof_seq start 1 increment 1
create sequence ix_core_value_seq start 1 increment 1
create sequence ix_core_xref_seq start 1 increment 1

    create table ix_core_acl (
       id int8 not null,
        perm int4,
        primary key (id)
    )

    create table ix_core_acl_group (
       ix_core_acl_id int8 not null,
        ix_core_group_id int8 not null
    )

    create table ix_core_acl_principal (
       ix_core_acl_id int8 not null,
        ix_core_principal_id int8 not null
    )

    create table ix_core_backup (
       id int8 not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version int8,
        compressed boolean not null,
        data bytea,
        kind varchar(255),
        refid varchar(255),
        sha1 varchar(255),
        namespace_id int8,
        primary key (id)
    )

    create table ix_core_edit (
       id uuid not null,
        batch varchar(64),
        comments text,
        created int8,
        kind varchar(255),
        new_value text,
        old_value text,
        path varchar(1024),
        refid varchar(255),
        version varchar(255),
        editor_id int8,
        primary key (id)
    )

    create table ix_core_etag (
       id int8 not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version int8,
        count int4,
        etag varchar(16),
        filter varchar(4000),
        method varchar(10),
        path varchar(255),
        query varchar(2048),
        sha1 varchar(40),
        skip int4,
        status int4,
        top int4,
        total int4,
        uri varchar(4000),
        namespace_id int8,
        primary key (id)
    )

    create table ix_core_figure (
       DTYPE varchar(31) not null,
        id int8 not null,
        caption varchar(255),
        data bytea,
        mime_type varchar(255),
        sha1 varchar(140),
        data_size int4,
        url varchar(1024),
        parent_id int8,
        primary key (id)
    )

    create table ix_core_filedata (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        data bytea,
        mime_type varchar(255),
        sha1 varchar(140),
        data_size int8,
        primary key (id)
    )

    create table ix_core_group (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    create table ix_core_group_principal (
       ix_core_group_id int8 not null,
        ix_core_principal_id int8 not null,
        primary key (ix_core_group_id, ix_core_principal_id)
    )

    create table ix_core_namespace (
       id int8 not null,
        location varchar(1024),
        modifier int4,
        name varchar(255),
        owner_id int8,
        primary key (id)
    )

    create table ix_core_payload (
       id varchar(40) not null,
        created timestamp,
        mime_type varchar(128),
        name varchar(1024),
        sha1 varchar(40),
        capacity int8,
        namespace_id int8,
        primary key (id)
    )

    create table ix_core_payload_property (
       ix_core_payload_id varchar(40) not null,
        ix_core_value_id int8 not null
    )

    create table ix_core_principal (
       id int8 not null,
        is_admin boolean,
        created timestamp,
        deprecated boolean not null,
        email varchar(255),
        modified timestamp,
        provider varchar(255),
        uri varchar(1024),
        username varchar(255),
        version int8,
        selfie_id int8,
        primary key (id)
    )

    create table ix_core_structure (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        atropi int4,
        charge int4,
        count int4,
        created timestamp,
        defined_stereo int4,
        deprecated boolean not null,
        digest varchar(128),
        ez_centers int4,
        formula varchar(255),
        last_edited timestamp,
        molfile text,
        mwt float8,
        optical int4,
        smiles text,
        stereo_centers int4,
        stereo varchar(255),
        stereo_comments text,
        version int8,
        internal_references text,
        record_access bytea,
        created_by_id int8,
        last_edited_by_id int8,
        primary key (id)
    )

    create table ix_core_structure_link (
       ix_core_structure_id varchar(40) not null,
        ix_core_xref_id int8 not null
    )

    create table ix_core_structure_property (
       ix_core_structure_id varchar(40) not null,
        ix_core_value_id int8 not null
    )

    create table ix_core_userprof (
       id int8 not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version int8,
        active boolean not null,
        hashp varchar(255),
        apikey varchar(255),
        ROLES_JSON text,
        salt varchar(255),
        system_auth boolean not null,
        namespace_id int8,
        user_id int8,
        primary key (id)
    )

    create table ix_core_userprof_prop (
       ix_core_userprof_id int8 not null,
        ix_core_value_id int8 not null
    )

    create table ix_core_value (
       DTYPE varchar(31) not null,
        id int8 not null,
        label varchar(255),
        heading varchar(1024),
        major_topic boolean,
        text text,
        href text,
        term varchar(255),
        data bytea,
        mime_type varchar(32),
        sha1 varchar(40),
        data_size int4,
        intval int8,
        numval float8,
        unit varchar(255),
        average float8,
        lval float8,
        rval float8,
        strval varchar(1024),
        primary key (id)
    )

    create table ix_core_xref (
       id int8 not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version int8,
        kind varchar(255) not null,
        refid varchar(40) not null,
        namespace_id int8,
        primary key (id)
    )

    create table ix_core_xref_property (
       ix_core_xref_id int8 not null,
        ix_core_value_id int8 not null
    )

    create table ix_ginas_agentmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        agent_modification_process varchar(255),
        agent_modification_role varchar(255),
        agent_modification_type varchar(255),
        modification_group varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        agent_substance_uuid varchar(40),
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_amount (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        approval_id varchar(10),
        average float8,
        high float8,
        high_limit float8,
        low float8,
        low_limit float8,
        non_numeric_value varchar(255),
        type varchar(255),
        units varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_code (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        code varchar(255) not null,
        code_system varchar(255),
        code_text text,
        comments text,
        type varchar(255),
        url text,
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_component (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        type varchar(255),
        role varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        substance_uuid varchar(40),
        amount_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_definition (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        definition text,
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_glycosylation (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        glycosylation_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        c_glycosylation_sites_uuid varchar(40),
        n_glycosylation_sites_uuid varchar(40),
        o_glycosylation_sites_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_linkage (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        linkage varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_material (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        defining boolean,
        type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        amount_uuid varchar(40),
        monomer_substance_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_mixture (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        created_by_id int8,
        last_edited_by_id int8,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_modifications (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_moiety (
       inner_uuid varchar(255) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        uuid uuid,
        created_by_id int8,
        last_edited_by_id int8,
        count_uuid varchar(40),
        owner_uuid varchar(40),
        structure_id varchar(40),
        primary key (inner_uuid)
    )

    create table ix_ginas_name (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        display_name boolean not null,
        domains text,
        full_name text,
        languages text,
        name varchar(255) not null,
        name_jurisdiction text,
        preferred boolean not null,
        std_name text,
        type varchar(32),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nameorg (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        deprecated_date timestamp,
        name_org varchar(255) not null,
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_note (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        note text,
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        nucleic_acid_sub_type varchar(255),
        nucleic_acid_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        modifications_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid_subunits (
       ix_ginas_nucleicacid_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_otherlinks (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        linkage_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_parameter (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        name varchar(255) not null,
        type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        modification_group varchar(255),
        physical_modification_role varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalpar (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        parameter_name varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_polymer (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        created_by_id int8,
        last_edited_by_id int8,
        classification_uuid varchar(40),
        display_structure_id varchar(40),
        idealized_structure_id varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_property (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        defining boolean,
        name varchar(255) not null,
        property_type varchar(255),
        type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        disulf_json text,
        protein_sub_type varchar(255),
        protein_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        glycosylation_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein_subunit (
       ix_ginas_protein_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_reference (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        citation text,
        doc_type varchar(255),
        document_date timestamp,
        id varchar(255),
        public_domain boolean not null,
        tags text,
        uploaded_file varchar(1024),
        url text,
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_relationship (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        comments text,
        interaction_type varchar(255),
        originator_uuid varchar(255),
        qualification varchar(255),
        type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        amount_uuid varchar(40),
        mediator_substance_uuid varchar(40),
        owner_uuid varchar(40),
        related_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_site_lob (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        site_count int8 not null,
        site_type varchar(255),
        sites_json text,
        sites_short_hand text,
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_ssg1 (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_ssg3 (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        created_by_id int8,
        last_edited_by_id int8,
        definition_uuid varchar(40),
        grade_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_ssg3_grade (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        name varchar(255),
        type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_strucdiv (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        developmental_stage varchar(255),
        fraction_material_type varchar(255),
        fraction_name varchar(255),
        infra_specific_name varchar(255),
        infra_specific_type varchar(255),
        organism_author varchar(255),
        organism_family varchar(255),
        organism_genus varchar(255),
        organism_species varchar(255),
        part text,
        part_location varchar(255),
        source_material_class varchar(255),
        source_material_state varchar(255),
        source_material_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        maternal_uuid varchar(40),
        paternal_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_structuralmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        extent varchar(255),
        location_type varchar(255),
        modification_group varchar(255),
        moleculare_fragment_role varchar(255),
        residue_modified varchar(255),
        structural_modification_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        extent_amount_uuid varchar(40),
        molecular_fragment_uuid varchar(40),
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        approval_id varchar(20),
        approved timestamp,
        change_reason varchar(255),
        definition_level int4,
        definition_type int4,
        status varchar(255),
        class int4,
        version varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        approved_by_id int8,
        modifications_uuid varchar(40),
        structure_id varchar(40),
        mixture_uuid varchar(40),
        nucleic_acid_uuid varchar(40),
        polymer_uuid varchar(40),
        protein_uuid varchar(40),
        specified_substance_uuid varchar(40),
        specified_substance_g3_uuid varchar(40),
        structurally_diverse_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance_mix_comp (
       ix_ginas_mixture_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_ss_comp (
       ix_ginas_ssg1_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_tags (
       ix_ginas_substance_uuid varchar(40) not null,
        ix_core_value_id int8 not null
    )

    create table ix_ginas_substanceref (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        approval_ID varchar(32),
        ref_pname varchar(1024),
        refuuid varchar(128),
        substance_class varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_subunit (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        sequence text,
        subunit_index int4,
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_sugar (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        sugar varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_unit (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        attachmentMap text,
        attachment_count int4,
        label varchar(255),
        structure text,
        type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        amap_id int8,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table polymer_classification (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        polymer_class varchar(255),
        polymer_geometry varchar(255),
        polymer_subclass text,
        source_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    alter table if exists ix_core_backup 
       add constraint UK_6n0ebodjb5t7yoxowli7t5qud unique (refid)

    alter table if exists ix_core_etag 
       add constraint UK_hvark3ftc0xax8dcbjuftcn7v unique (etag)

    alter table if exists ix_core_group 
       add constraint UK_pm62da77mybok0t03dd0a9oum unique (name)

    alter table if exists ix_core_namespace 
       add constraint UK_t3wv0p58vflh5n2vnj6rjan75 unique (name)

    alter table if exists ix_core_principal 
       add constraint UK_p8p720bdp9bkws54yip7x1t47 unique (username)

    alter table if exists ix_ginas_moiety 
       add constraint UK_8cr4axbsithvjxcfhnltaejsp unique (uuid)

    alter table if exists ix_core_acl_group 
       add constraint fkffablaywfq4inuntnok9otle 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table if exists ix_core_acl_group 
       add constraint fk8a5l9ehfusnoigq1r4robs2da 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table if exists ix_core_acl_principal 
       add constraint fkpf5d4mu9td8et6k5pgt78jma8 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table if exists ix_core_acl_principal 
       add constraint fkc9bo2bwjfcf7djff6coigl2b1 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table if exists ix_core_backup 
       add constraint fknulpohkjr0e7imml16hnmcl2c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table if exists ix_core_edit 
       add constraint fkj2b3ncg8uek4q4tjua17gvkgi 
       foreign key (editor_id) 
       references ix_core_principal

    alter table if exists ix_core_etag 
       add constraint fk22kqxphqlg1d1hmsi2wtm6k0c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table if exists ix_core_figure 
       add constraint fk911xrg14bag2m8e096i9d75lu 
       foreign key (parent_id) 
       references ix_core_figure

    alter table if exists ix_core_group_principal 
       add constraint fkp21u3ryjg094idoi9alrg90p7 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table if exists ix_core_group_principal 
       add constraint fk1voeekm54sy5sc3et2fqo0unx 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table if exists ix_core_namespace 
       add constraint fkdgo5yjubgilh1nauv1t69gslx 
       foreign key (owner_id) 
       references ix_core_principal

    alter table if exists ix_core_payload 
       add constraint fkd150c5llpyncrqgpmqvvj8c9g 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table if exists ix_core_payload_property 
       add constraint fki6ubcj55u3pq0gm70ay7umle1 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table if exists ix_core_payload_property 
       add constraint fk6j2diflggrmws0k3suo8ms215 
       foreign key (ix_core_payload_id) 
       references ix_core_payload

    alter table if exists ix_core_principal 
       add constraint fk6th1516rd9u5crfw7r12qtypk 
       foreign key (selfie_id) 
       references ix_core_figure

    alter table if exists ix_core_structure 
       add constraint fksobht0ese9794r3q9k1q6i7gp 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_core_structure 
       add constraint fk37rfonx9x7vmkwsru7dxxqhhk 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_core_structure_link 
       add constraint fkdca3xgv2a5p344i74yc7sk89v 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table if exists ix_core_structure_link 
       add constraint fk44si68uocnubt6vaobd4mgmmy 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table if exists ix_core_structure_property 
       add constraint fk4n49941jj4uufoosy5n1g9rg6 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table if exists ix_core_structure_property 
       add constraint fkok4h9jsov59dh00wnrmsnd12x 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table if exists ix_core_userprof 
       add constraint fks5bqupbwldu7843qnt8tuntnu 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table if exists ix_core_userprof 
       add constraint fknq0obnfqd9j3uh1uxdqn3ouq7 
       foreign key (user_id) 
       references ix_core_principal

    alter table if exists ix_core_userprof_prop 
       add constraint fknfow9qqryxbxgppprcum5khf8 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table if exists ix_core_userprof_prop 
       add constraint fklloqe5wbjywhajh4tw6ilfnvg 
       foreign key (ix_core_userprof_id) 
       references ix_core_userprof

    alter table if exists ix_core_xref 
       add constraint fk6g9t8ugidjwe166t5nk7x2wqm 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table if exists ix_core_xref_property 
       add constraint fkaucrto6dcvyyq1n6jo332gqsf 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table if exists ix_core_xref_property 
       add constraint fkmr6or6lteb684kq2e1dgsxl1w 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table if exists ix_ginas_agentmod 
       add constraint fk837ol47m9wstcu74fp5toniam 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_agentmod 
       add constraint fk2prhrnc5vlo55jxu1rxgpfdw1 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_agentmod 
       add constraint fk2x5f4lw85tpkym1r3urwp2u3w 
       foreign key (agent_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_agentmod 
       add constraint fki7hwi4cyu1hi7yjo2ddwkig51 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_agentmod 
       add constraint fk9ybw4linkblw3p4u25cq6qs0d 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table if exists ix_ginas_amount 
       add constraint fkqsmrbuknll0fmv6jthf4cycy5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_amount 
       add constraint fk9leptgx7incy9twmrwcpeo2bm 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_code 
       add constraint fkfwn6blkrhusg1xhrue0u820p 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_code 
       add constraint fkpio633txjf8p5soyujcrtbx9v 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_code 
       add constraint fke9p0ygr5drc93bxry80f9y215 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_component 
       add constraint fkodvtp4qvwc7nyfr3lbc893o6m 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_component 
       add constraint fkbbvqudmdnm60le1imuwb2uj5x 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_component 
       add constraint fkql4nn094peyvxrwctj1ga2wp2 
       foreign key (substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_component 
       add constraint fksqa51pxp5tbk6vyu34qbr8c5u 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_definition 
       add constraint fk4kcslc98jcqx137enxl5fgs5t 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_definition 
       add constraint fk9wxg9p9i1bi7qoxfcu9gkg9og 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_glycosylation 
       add constraint fk6dapjdumuglm11xxawpupefqm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_glycosylation 
       add constraint fkpglm1avjx8n78aom78j3ju3bf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_glycosylation 
       add constraint fkqiim2s89ddjuxbkhpv3xa023j 
       foreign key (c_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_glycosylation 
       add constraint fkffabrw84stgayaui9g1a4wk1g 
       foreign key (n_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_glycosylation 
       add constraint fkmt1ufykgpny0dlxj36h6tgxwr 
       foreign key (o_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_linkage 
       add constraint fkq619bp0y4e8y3c6efgyp2k8ux 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_linkage 
       add constraint fkfctm6wmaejthxy8y5gtbaqd80 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_linkage 
       add constraint fkotqo99g96i7epg4s384xushll 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table if exists ix_ginas_linkage 
       add constraint fkaao7lfx6xsyc4l1cpmsga4vre 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_material 
       add constraint fk6ts531mold2ibya0c038hebea 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_material 
       add constraint fkpab2df5aaru3riy5vxd86uve3 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_material 
       add constraint fkipvr7dsgmt37oig421t41o385 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_material 
       add constraint fkegxevel4526aib74sesmtu25e 
       foreign key (monomer_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_material 
       add constraint fkuvsb9isctq5ela0dqy2hhwti 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table if exists ix_ginas_mixture 
       add constraint fk4tqay4hgaqpm3sq8rx9184jat 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_mixture 
       add constraint fkjfwb6hqmtuoadhdx7wpkhxaju 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_mixture 
       add constraint fko0yqo20vk9l8tqybgp75o23km 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_modifications 
       add constraint fknt72fojjxifrwa7bfwjw8cpm5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_modifications 
       add constraint fkpod9b4pm2tw1e4llfvayoivw4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_moiety 
       add constraint fkkw3ljg8rkiv07pcn0o0n3o02a 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_moiety 
       add constraint fk3a5dgbi1pmatnvuta5a4wy3aq 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_moiety 
       add constraint fkf0mktcfnu1ly1x7ubmf41lh2n 
       foreign key (count_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_moiety 
       add constraint fk8olyp6rpiq8yxtuk3mxsnbels 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_moiety 
       add constraint fkc3r993grtkv5al4opvpv554ga 
       foreign key (structure_id) 
       references ix_core_structure

    alter table if exists ix_ginas_name 
       add constraint fklhhdrsy7v2qr1amwmw0981mv2 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_name 
       add constraint fkgwls3gldgeqmgliev3kcvhjml 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_name 
       add constraint fkeqm42ow1b2o1c3uhu3d1k2efm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_nameorg 
       add constraint fkk77bj1lax07ocd00s3sfmn6ot 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_nameorg 
       add constraint fkm5w47bga21kw55x56q7jbbguj 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_nameorg 
       add constraint fkqtmeq2vb6siyu40vxnw4c8vq 
       foreign key (owner_uuid) 
       references ix_ginas_name

    alter table if exists ix_ginas_note 
       add constraint fkge1aq2fv84ucy1ilwx97vpuwu 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_note 
       add constraint fkpg2o4yxwwlbbw1rro1c5df60 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_note 
       add constraint fkj3nrt8342rqojj5d4k24w5tgm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_nucleicacid 
       add constraint fkm9yv3dunytjgyjfiq6r503lyr 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_nucleicacid 
       add constraint fk6jk9rw9co4676wg98pvseggxc 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_nucleicacid 
       add constraint fkck0ay4di4y12vsqd9gqw4qh4b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table if exists ix_ginas_nucleicacid_subunits 
       add constraint fkjun57ycd07jv8oe3h8566r488 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table if exists ix_ginas_nucleicacid_subunits 
       add constraint fkdby8ustw4fo38x6e98cg814td 
       foreign key (ix_ginas_nucleicacid_uuid) 
       references ix_ginas_nucleicacid

    alter table if exists ix_ginas_otherlinks 
       add constraint fk9sukhdr4s0yje92m8hp82hitx 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_otherlinks 
       add constraint fkigwh0j2irewbpsb1xgael3pim 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_otherlinks 
       add constraint fkdub4td7p5ki0u4dl83j4u9ysr 
       foreign key (owner_uuid) 
       references ix_ginas_protein

    alter table if exists ix_ginas_otherlinks 
       add constraint fk5nj85bcu54jc56se3hm4q3chm 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_parameter 
       add constraint fklbuqth4cgx61sh4rcci2mdl1o 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_parameter 
       add constraint fklj93g1oplslasut6r924dft2l 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_parameter 
       add constraint fk9ixg1ch1e0hueyta2dh4vlidg 
       foreign key (owner_uuid) 
       references ix_ginas_property

    alter table if exists ix_ginas_parameter 
       add constraint fkdxnyu34iqqponnw4bnj9hk8rb 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_parameter 
       add constraint fkix1d880p7x7v51quhcre616af 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_physicalmod 
       add constraint fk32ojpkiiy03fk8ro0eyclrbkh 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_physicalmod 
       add constraint fk23yuiouuyqodtlxmjxopv0ybf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_physicalmod 
       add constraint fkd8fg9mm0ilkfdii08s5qsonde 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table if exists ix_ginas_physicalpar 
       add constraint fkrfgl3mys5n5wiknd32enb7hmb 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_physicalpar 
       add constraint fkd1w1xyqt12divo39phpoi2113 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_physicalpar 
       add constraint fk4ce1vbnehe206ru4gctnlkidh 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_physicalpar 
       add constraint fk1e30fjxi7rv1m875713tges77 
       foreign key (owner_uuid) 
       references ix_ginas_physicalmod

    alter table if exists ix_ginas_polymer 
       add constraint fk8axkm0cbpwpc43krkhw8y6tad 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_polymer 
       add constraint fk5o81f597yvub0mf1b6cnqx8ev 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_polymer 
       add constraint fktn8tft3hwqnpv8tkfhtbh5jsm 
       foreign key (classification_uuid) 
       references polymer_classification

    alter table if exists ix_ginas_polymer 
       add constraint fkcd56mdyyo9bvrrd80w0y8iixl 
       foreign key (display_structure_id) 
       references ix_core_structure

    alter table if exists ix_ginas_polymer 
       add constraint fk264hsvr9c8q3w1e51j99ua2d0 
       foreign key (idealized_structure_id) 
       references ix_core_structure

    alter table if exists ix_ginas_property 
       add constraint fktla10hxba7smca0g675soamsq 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_property 
       add constraint fkafltirwo87s1so6vigtf1s8mn 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_property 
       add constraint fkrlu3e72lq9y59122xd75q51vt 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_property 
       add constraint fkoh8nhvrowpdthcxj69pwkke9t 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_property 
       add constraint fkpbekqdofak8ol2fq92f5onn1t 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_protein 
       add constraint fk6ay15bqty5r2xmk13a4ld75rm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_protein 
       add constraint fkpovxe3t3ycsa1x6xivr20ukbh 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_protein 
       add constraint fkec7ms0paeosyymbpsnbu5pjfb 
       foreign key (glycosylation_uuid) 
       references ix_ginas_glycosylation

    alter table if exists ix_ginas_protein_subunit 
       add constraint fklk7qxuwt9o7g8k6rphr5jj7ey 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table if exists ix_ginas_protein_subunit 
       add constraint fk39xyg6fxghld06apb91xc1xt6 
       foreign key (ix_ginas_protein_uuid) 
       references ix_ginas_protein

    alter table if exists ix_ginas_reference 
       add constraint fkpv1epn9el8d1fpqct4px1nio7 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_reference 
       add constraint fk975dqn3b674b23ga0igmmct25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_reference 
       add constraint fkk7kui3q4qm7pwdq679ibkyi5h 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_relationship 
       add constraint fk70gmjxu8uevujxd4uetj6nfm3 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_relationship 
       add constraint fkmsd9lm6ayae7qbwp1iv50ftbb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_relationship 
       add constraint fk492eul84p3uecmkpqmd8ujvkb 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_relationship 
       add constraint fksim8mqlrevhpl0aa0hrdh3wwe 
       foreign key (mediator_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_relationship 
       add constraint fkr1msd0rheudj2srgokqrftrek 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_relationship 
       add constraint fkb6yhrsc7dprxg0apyknpue5ij 
       foreign key (related_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_site_lob 
       add constraint fkfbc7le8ehsxj39t2yikmmy3py 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_site_lob 
       add constraint fkh2cg1v3f9ha8t0w4l8iprib2g 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_ssg1 
       add constraint fk3tljtp4q2e94j2q27hgnnhse4 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_ssg1 
       add constraint fkle7gsf4fuf75tsrvksgvkjc25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_ssg3 
       add constraint fkphwuwyutg3qw0m6sltk2k313k 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_ssg3 
       add constraint fk8wpbv2gmw0rr6a0pywbvac0i5 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_ssg3 
       add constraint fk330e5sasucjp4134wpwtu8lwb 
       foreign key (definition_uuid) 
       references ix_ginas_definition

    alter table if exists ix_ginas_ssg3 
       add constraint fklbcuwggmsgljs9ft8rg5e04te 
       foreign key (grade_uuid) 
       references ix_ginas_ssg3_grade

    alter table if exists ix_ginas_ssg3 
       add constraint fk769l9w19w81s2hyvsi4o65evx 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_ssg3_grade 
       add constraint fknxhvkenjdx6shmj1qfw7em6sc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_ssg3_grade 
       add constraint fknyx3tbg0b5biha79eybm68heb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_strucdiv 
       add constraint fkqpk4af5q91r4nsm521kd57298 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_strucdiv 
       add constraint fk4epq4o38ci57y71dxu7ootl41 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_strucdiv 
       add constraint fkhh72pwq35aaqgv370uavhtnjh 
       foreign key (maternal_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_strucdiv 
       add constraint fk6lcu1945kbaxi6fmir3qt5ugk 
       foreign key (paternal_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_strucdiv 
       add constraint fk27p7qapsxr5d2efscf8k7521 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_structuralmod 
       add constraint fkndd0pxjud610e953hg730emw 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_structuralmod 
       add constraint fk1ysjs1dx6uo8flj8rkiscscx4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_structuralmod 
       add constraint fktkmtm9vpmaklmypp3jad1pspp 
       foreign key (extent_amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_structuralmod 
       add constraint fk6n3mtotuwqi717fr2evp3dfxi 
       foreign key (molecular_fragment_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_structuralmod 
       add constraint fkoi4vt2lg0x2v3s4urckwjb3s3 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table if exists ix_ginas_structuralmod 
       add constraint fkb94sjca6cclvcwtx2osvdeuu 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_substance 
       add constraint fka9b6lpf9y3l0t04rviskjs8o1 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_substance 
       add constraint fk9hlo5n1alfg4rgloypq8agc3e 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_substance 
       add constraint fkmb0vxvmui506xtkh18lw1ucym 
       foreign key (approved_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_substance 
       add constraint fk30b2jg1r8dr4ibvt3f4h7ui3b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table if exists ix_ginas_substance 
       add constraint fkau9cajhw1nffg9w1vh0am4ls4 
       foreign key (structure_id) 
       references ix_core_structure

    alter table if exists ix_ginas_substance 
       add constraint fkekk08a5uheng9eocf61xo4m2l 
       foreign key (mixture_uuid) 
       references ix_ginas_mixture

    alter table if exists ix_ginas_substance 
       add constraint fk8lglxcodtpv6nj0wbw61cpdk9 
       foreign key (nucleic_acid_uuid) 
       references ix_ginas_nucleicacid

    alter table if exists ix_ginas_substance 
       add constraint fkncdqbv3ilcg21bws3e3y0xwg4 
       foreign key (polymer_uuid) 
       references ix_ginas_polymer

    alter table if exists ix_ginas_substance 
       add constraint fkcw3qqer4es16onh3qgcuf6jb8 
       foreign key (protein_uuid) 
       references ix_ginas_protein

    alter table if exists ix_ginas_substance 
       add constraint fkd29meikxu3elfx1w5dket3ia5 
       foreign key (specified_substance_uuid) 
       references ix_ginas_ssg1

    alter table if exists ix_ginas_substance 
       add constraint fkvubtca9k1urb0aqv6awf7evk 
       foreign key (specified_substance_g3_uuid) 
       references ix_ginas_ssg3

    alter table if exists ix_ginas_substance 
       add constraint fkhrs798kf99tmayeg8hjbo9vdl 
       foreign key (structurally_diverse_uuid) 
       references ix_ginas_strucdiv

    alter table if exists ix_ginas_substance_mix_comp 
       add constraint fkjsfcmh12rru7tls24cbkbmb0t 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table if exists ix_ginas_substance_mix_comp 
       add constraint fkpubptahgdm25hadwlf3pwlfap 
       foreign key (ix_ginas_mixture_uuid) 
       references ix_ginas_mixture

    alter table if exists ix_ginas_substance_ss_comp 
       add constraint fkb8ofx08elpr455o7a72rrr9tm 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table if exists ix_ginas_substance_ss_comp 
       add constraint fkaf57kow6qnxnp2ya35n21jiyo 
       foreign key (ix_ginas_ssg1_uuid) 
       references ix_ginas_ssg1

    alter table if exists ix_ginas_substance_tags 
       add constraint fkjlsvy9nlwl3vf5mvhcvf0y80k 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table if exists ix_ginas_substance_tags 
       add constraint fk2hyjvdeqia2qiemoagh6yjq6b 
       foreign key (ix_ginas_substance_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_substanceref 
       add constraint fko2bjxrp2qi847appx7ecf65vc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_substanceref 
       add constraint fkm6qbi1moehd7wqh9w2ip412us 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_subunit 
       add constraint fk7kjfdjus3twoyg4vd2jp367n6 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_subunit 
       add constraint fk9pyegqu1n4ekd45fdmitw12t7 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_sugar 
       add constraint fke6ndxx94bjimsgux4lygsh51f 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_sugar 
       add constraint fk1p4pfd811kxxjqfxbiuu9sknv 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_sugar 
       add constraint fkkx0aeyak8r0byugf719kqu7ms 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table if exists ix_ginas_sugar 
       add constraint fkpx5dhn0168ipbpu04xgmby97y 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_unit 
       add constraint fkl4qe419byvtxe3epgd4a50glc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_unit 
       add constraint fknbsd63mfulnly1dtk7f6vxcq4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_unit 
       add constraint fkq8b5gi5r7thxi8vyrli5lrtu2 
       foreign key (amap_id) 
       references ix_core_value

    alter table if exists ix_ginas_unit 
       add constraint fk2x4h6n93ud35rtm5nxt7xrcmw 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_unit 
       add constraint fkf3rxpagehygabef32q3kn4am 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table if exists polymer_classification 
       add constraint fk9tp2yhc5vdofsdnx5cit45hdy 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists polymer_classification 
       add constraint fk6bup6ku2dri7cl4rgno4fd6dd 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists polymer_classification 
       add constraint fkl3chbblh2guqlw9ikn9grc3vb 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref
create sequence ix_core_acl_seq start 1 increment 1
create sequence ix_core_backup_seq start 1 increment 1
create sequence ix_core_etag_seq start 1 increment 1
create sequence ix_core_group_seq start 1 increment 1
create sequence ix_core_namespace_seq start 1 increment 1
create sequence ix_core_principal_seq start 1 increment 1
create sequence ix_core_userprof_seq start 1 increment 1
create sequence ix_core_value_seq start 1 increment 1
create sequence ix_core_xref_seq start 1 increment 1

    create table ix_core_acl (
       id int8 not null,
        perm int4,
        primary key (id)
    )

    create table ix_core_acl_group (
       ix_core_acl_id int8 not null,
        ix_core_group_id int8 not null
    )

    create table ix_core_acl_principal (
       ix_core_acl_id int8 not null,
        ix_core_principal_id int8 not null
    )

    create table ix_core_backup (
       id int8 not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version int8,
        compressed boolean not null,
        data bytea,
        kind varchar(255),
        refid varchar(255),
        sha1 varchar(255),
        namespace_id int8,
        primary key (id)
    )

    create table ix_core_edit (
       id uuid not null,
        batch varchar(64),
        comments text,
        created int8,
        kind varchar(255),
        new_value text,
        old_value text,
        path varchar(1024),
        refid varchar(255),
        version varchar(255),
        editor_id int8,
        primary key (id)
    )

    create table ix_core_etag (
       id int8 not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version int8,
        count int4,
        etag varchar(16),
        filter varchar(4000),
        method varchar(10),
        path varchar(255),
        query varchar(2048),
        sha1 varchar(40),
        skip int4,
        status int4,
        top int4,
        total int4,
        uri varchar(4000),
        namespace_id int8,
        primary key (id)
    )

    create table ix_core_figure (
       DTYPE varchar(31) not null,
        id int8 not null,
        caption varchar(255),
        data bytea,
        mime_type varchar(255),
        sha1 varchar(140),
        data_size int4,
        url varchar(1024),
        parent_id int8,
        primary key (id)
    )

    create table ix_core_filedata (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        data bytea,
        mime_type varchar(255),
        sha1 varchar(140),
        data_size int8,
        primary key (id)
    )

    create table ix_core_group (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    create table ix_core_group_principal (
       ix_core_group_id int8 not null,
        ix_core_principal_id int8 not null,
        primary key (ix_core_group_id, ix_core_principal_id)
    )

    create table ix_core_namespace (
       id int8 not null,
        location varchar(1024),
        modifier int4,
        name varchar(255),
        owner_id int8,
        primary key (id)
    )

    create table ix_core_payload (
       id varchar(40) not null,
        created timestamp,
        mime_type varchar(128),
        name varchar(1024),
        sha1 varchar(40),
        capacity int8,
        namespace_id int8,
        primary key (id)
    )

    create table ix_core_payload_property (
       ix_core_payload_id varchar(40) not null,
        ix_core_value_id int8 not null
    )

    create table ix_core_principal (
       id int8 not null,
        is_admin boolean,
        created timestamp,
        deprecated boolean not null,
        email varchar(255),
        modified timestamp,
        provider varchar(255),
        uri varchar(1024),
        username varchar(255),
        version int8,
        selfie_id int8,
        primary key (id)
    )

    create table ix_core_structure (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        atropi int4,
        charge int4,
        count int4,
        created timestamp,
        defined_stereo int4,
        deprecated boolean not null,
        digest varchar(128),
        ez_centers int4,
        formula varchar(255),
        last_edited timestamp,
        molfile text,
        mwt float8,
        optical int4,
        smiles text,
        stereo_centers int4,
        stereo varchar(255),
        stereo_comments text,
        version int8,
        internal_references text,
        record_access bytea,
        created_by_id int8,
        last_edited_by_id int8,
        primary key (id)
    )

    create table ix_core_structure_link (
       ix_core_structure_id varchar(40) not null,
        ix_core_xref_id int8 not null
    )

    create table ix_core_structure_property (
       ix_core_structure_id varchar(40) not null,
        ix_core_value_id int8 not null
    )

    create table ix_core_userprof (
       id int8 not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version int8,
        active boolean not null,
        hashp varchar(255),
        apikey varchar(255),
        ROLES_JSON text,
        salt varchar(255),
        system_auth boolean not null,
        namespace_id int8,
        user_id int8,
        primary key (id)
    )

    create table ix_core_userprof_prop (
       ix_core_userprof_id int8 not null,
        ix_core_value_id int8 not null
    )

    create table ix_core_value (
       DTYPE varchar(31) not null,
        id int8 not null,
        label varchar(255),
        heading varchar(1024),
        major_topic boolean,
        text text,
        href text,
        term varchar(255),
        data bytea,
        mime_type varchar(32),
        sha1 varchar(40),
        data_size int4,
        intval int8,
        numval float8,
        unit varchar(255),
        average float8,
        lval float8,
        rval float8,
        strval varchar(1024),
        primary key (id)
    )

    create table ix_core_xref (
       id int8 not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version int8,
        kind varchar(255) not null,
        refid varchar(40) not null,
        namespace_id int8,
        primary key (id)
    )

    create table ix_core_xref_property (
       ix_core_xref_id int8 not null,
        ix_core_value_id int8 not null
    )

    create table ix_ginas_agentmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        agent_modification_process varchar(255),
        agent_modification_role varchar(255),
        agent_modification_type varchar(255),
        modification_group varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        agent_substance_uuid varchar(40),
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_amount (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        approval_id varchar(10),
        average float8,
        high float8,
        high_limit float8,
        low float8,
        low_limit float8,
        non_numeric_value varchar(255),
        type varchar(255),
        units varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_code (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        code varchar(255) not null,
        code_system varchar(255),
        code_text text,
        comments text,
        type varchar(255),
        url text,
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_component (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        type varchar(255),
        role varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        substance_uuid varchar(40),
        amount_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_definition (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        definition text,
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_glycosylation (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        glycosylation_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        c_glycosylation_sites_uuid varchar(40),
        n_glycosylation_sites_uuid varchar(40),
        o_glycosylation_sites_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_linkage (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        linkage varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_material (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        defining boolean,
        type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        amount_uuid varchar(40),
        monomer_substance_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_mixture (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        created_by_id int8,
        last_edited_by_id int8,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_modifications (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_moiety (
       inner_uuid varchar(255) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        uuid uuid,
        created_by_id int8,
        last_edited_by_id int8,
        count_uuid varchar(40),
        owner_uuid varchar(40),
        structure_id varchar(40),
        primary key (inner_uuid)
    )

    create table ix_ginas_name (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        display_name boolean not null,
        domains text,
        full_name text,
        languages text,
        name varchar(255) not null,
        name_jurisdiction text,
        preferred boolean not null,
        std_name text,
        type varchar(32),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nameorg (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        deprecated_date timestamp,
        name_org varchar(255) not null,
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_note (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        note text,
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        nucleic_acid_sub_type varchar(255),
        nucleic_acid_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        modifications_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid_subunits (
       ix_ginas_nucleicacid_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_otherlinks (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        linkage_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_parameter (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        name varchar(255) not null,
        type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        modification_group varchar(255),
        physical_modification_role varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalpar (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        parameter_name varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_polymer (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        created_by_id int8,
        last_edited_by_id int8,
        classification_uuid varchar(40),
        display_structure_id varchar(40),
        idealized_structure_id varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_property (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        defining boolean,
        name varchar(255) not null,
        property_type varchar(255),
        type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        disulf_json text,
        protein_sub_type varchar(255),
        protein_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        glycosylation_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein_subunit (
       ix_ginas_protein_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_reference (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        citation text,
        doc_type varchar(255),
        document_date timestamp,
        id varchar(255),
        public_domain boolean not null,
        tags text,
        uploaded_file varchar(1024),
        url text,
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_relationship (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        comments text,
        interaction_type varchar(255),
        originator_uuid varchar(255),
        qualification varchar(255),
        type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        amount_uuid varchar(40),
        mediator_substance_uuid varchar(40),
        owner_uuid varchar(40),
        related_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_site_lob (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        site_count int8 not null,
        site_type varchar(255),
        sites_json text,
        sites_short_hand text,
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_ssg1 (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_ssg3 (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        created_by_id int8,
        last_edited_by_id int8,
        definition_uuid varchar(40),
        grade_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_ssg3_grade (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        name varchar(255),
        type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_strucdiv (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        developmental_stage varchar(255),
        fraction_material_type varchar(255),
        fraction_name varchar(255),
        infra_specific_name varchar(255),
        infra_specific_type varchar(255),
        organism_author varchar(255),
        organism_family varchar(255),
        organism_genus varchar(255),
        organism_species varchar(255),
        part text,
        part_location varchar(255),
        source_material_class varchar(255),
        source_material_state varchar(255),
        source_material_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        maternal_uuid varchar(40),
        paternal_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_structuralmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        extent varchar(255),
        location_type varchar(255),
        modification_group varchar(255),
        moleculare_fragment_role varchar(255),
        residue_modified varchar(255),
        structural_modification_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        extent_amount_uuid varchar(40),
        molecular_fragment_uuid varchar(40),
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        approval_id varchar(20),
        approved timestamp,
        change_reason varchar(255),
        definition_level int4,
        definition_type int4,
        status varchar(255),
        class int4,
        version varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        approved_by_id int8,
        modifications_uuid varchar(40),
        structure_id varchar(40),
        mixture_uuid varchar(40),
        nucleic_acid_uuid varchar(40),
        polymer_uuid varchar(40),
        protein_uuid varchar(40),
        specified_substance_uuid varchar(40),
        specified_substance_g3_uuid varchar(40),
        structurally_diverse_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance_mix_comp (
       ix_ginas_mixture_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_ss_comp (
       ix_ginas_ssg1_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_tags (
       ix_ginas_substance_uuid varchar(40) not null,
        ix_core_value_id int8 not null
    )

    create table ix_ginas_substanceref (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        approval_ID varchar(32),
        ref_pname varchar(1024),
        refuuid varchar(128),
        substance_class varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_subunit (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        sequence text,
        subunit_index int4,
        created_by_id int8,
        last_edited_by_id int8,
        primary key (uuid)
    )

    create table ix_ginas_sugar (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        sugar varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_unit (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        attachmentMap text,
        attachment_count int4,
        label varchar(255),
        structure text,
        type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        amap_id int8,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table polymer_classification (
       uuid varchar(40) not null,
        created timestamp,
        current_version int4 not null,
        deprecated boolean not null,
        internal_version int8,
        last_edited timestamp,
        record_access bytea,
        internal_references text,
        polymer_class varchar(255),
        polymer_geometry varchar(255),
        polymer_subclass text,
        source_type varchar(255),
        created_by_id int8,
        last_edited_by_id int8,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    alter table if exists ix_core_backup 
       add constraint UK_6n0ebodjb5t7yoxowli7t5qud unique (refid)

    alter table if exists ix_core_etag 
       add constraint UK_hvark3ftc0xax8dcbjuftcn7v unique (etag)

    alter table if exists ix_core_group 
       add constraint UK_pm62da77mybok0t03dd0a9oum unique (name)

    alter table if exists ix_core_namespace 
       add constraint UK_t3wv0p58vflh5n2vnj6rjan75 unique (name)

    alter table if exists ix_core_principal 
       add constraint UK_p8p720bdp9bkws54yip7x1t47 unique (username)

    alter table if exists ix_ginas_moiety 
       add constraint UK_8cr4axbsithvjxcfhnltaejsp unique (uuid)

    alter table if exists ix_core_acl_group 
       add constraint fkffablaywfq4inuntnok9otle 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table if exists ix_core_acl_group 
       add constraint fk8a5l9ehfusnoigq1r4robs2da 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table if exists ix_core_acl_principal 
       add constraint fkpf5d4mu9td8et6k5pgt78jma8 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table if exists ix_core_acl_principal 
       add constraint fkc9bo2bwjfcf7djff6coigl2b1 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table if exists ix_core_backup 
       add constraint fknulpohkjr0e7imml16hnmcl2c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table if exists ix_core_edit 
       add constraint fkj2b3ncg8uek4q4tjua17gvkgi 
       foreign key (editor_id) 
       references ix_core_principal

    alter table if exists ix_core_etag 
       add constraint fk22kqxphqlg1d1hmsi2wtm6k0c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table if exists ix_core_figure 
       add constraint fk911xrg14bag2m8e096i9d75lu 
       foreign key (parent_id) 
       references ix_core_figure

    alter table if exists ix_core_group_principal 
       add constraint fkp21u3ryjg094idoi9alrg90p7 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table if exists ix_core_group_principal 
       add constraint fk1voeekm54sy5sc3et2fqo0unx 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table if exists ix_core_namespace 
       add constraint fkdgo5yjubgilh1nauv1t69gslx 
       foreign key (owner_id) 
       references ix_core_principal

    alter table if exists ix_core_payload 
       add constraint fkd150c5llpyncrqgpmqvvj8c9g 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table if exists ix_core_payload_property 
       add constraint fki6ubcj55u3pq0gm70ay7umle1 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table if exists ix_core_payload_property 
       add constraint fk6j2diflggrmws0k3suo8ms215 
       foreign key (ix_core_payload_id) 
       references ix_core_payload

    alter table if exists ix_core_principal 
       add constraint fk6th1516rd9u5crfw7r12qtypk 
       foreign key (selfie_id) 
       references ix_core_figure

    alter table if exists ix_core_structure 
       add constraint fksobht0ese9794r3q9k1q6i7gp 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_core_structure 
       add constraint fk37rfonx9x7vmkwsru7dxxqhhk 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_core_structure_link 
       add constraint fkdca3xgv2a5p344i74yc7sk89v 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table if exists ix_core_structure_link 
       add constraint fk44si68uocnubt6vaobd4mgmmy 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table if exists ix_core_structure_property 
       add constraint fk4n49941jj4uufoosy5n1g9rg6 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table if exists ix_core_structure_property 
       add constraint fkok4h9jsov59dh00wnrmsnd12x 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table if exists ix_core_userprof 
       add constraint fks5bqupbwldu7843qnt8tuntnu 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table if exists ix_core_userprof 
       add constraint fknq0obnfqd9j3uh1uxdqn3ouq7 
       foreign key (user_id) 
       references ix_core_principal

    alter table if exists ix_core_userprof_prop 
       add constraint fknfow9qqryxbxgppprcum5khf8 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table if exists ix_core_userprof_prop 
       add constraint fklloqe5wbjywhajh4tw6ilfnvg 
       foreign key (ix_core_userprof_id) 
       references ix_core_userprof

    alter table if exists ix_core_xref 
       add constraint fk6g9t8ugidjwe166t5nk7x2wqm 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table if exists ix_core_xref_property 
       add constraint fkaucrto6dcvyyq1n6jo332gqsf 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table if exists ix_core_xref_property 
       add constraint fkmr6or6lteb684kq2e1dgsxl1w 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table if exists ix_ginas_agentmod 
       add constraint fk837ol47m9wstcu74fp5toniam 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_agentmod 
       add constraint fk2prhrnc5vlo55jxu1rxgpfdw1 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_agentmod 
       add constraint fk2x5f4lw85tpkym1r3urwp2u3w 
       foreign key (agent_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_agentmod 
       add constraint fki7hwi4cyu1hi7yjo2ddwkig51 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_agentmod 
       add constraint fk9ybw4linkblw3p4u25cq6qs0d 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table if exists ix_ginas_amount 
       add constraint fkqsmrbuknll0fmv6jthf4cycy5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_amount 
       add constraint fk9leptgx7incy9twmrwcpeo2bm 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_code 
       add constraint fkfwn6blkrhusg1xhrue0u820p 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_code 
       add constraint fkpio633txjf8p5soyujcrtbx9v 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_code 
       add constraint fke9p0ygr5drc93bxry80f9y215 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_component 
       add constraint fkodvtp4qvwc7nyfr3lbc893o6m 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_component 
       add constraint fkbbvqudmdnm60le1imuwb2uj5x 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_component 
       add constraint fkql4nn094peyvxrwctj1ga2wp2 
       foreign key (substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_component 
       add constraint fksqa51pxp5tbk6vyu34qbr8c5u 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_definition 
       add constraint fk4kcslc98jcqx137enxl5fgs5t 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_definition 
       add constraint fk9wxg9p9i1bi7qoxfcu9gkg9og 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_glycosylation 
       add constraint fk6dapjdumuglm11xxawpupefqm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_glycosylation 
       add constraint fkpglm1avjx8n78aom78j3ju3bf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_glycosylation 
       add constraint fkqiim2s89ddjuxbkhpv3xa023j 
       foreign key (c_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_glycosylation 
       add constraint fkffabrw84stgayaui9g1a4wk1g 
       foreign key (n_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_glycosylation 
       add constraint fkmt1ufykgpny0dlxj36h6tgxwr 
       foreign key (o_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_linkage 
       add constraint fkq619bp0y4e8y3c6efgyp2k8ux 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_linkage 
       add constraint fkfctm6wmaejthxy8y5gtbaqd80 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_linkage 
       add constraint fkotqo99g96i7epg4s384xushll 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table if exists ix_ginas_linkage 
       add constraint fkaao7lfx6xsyc4l1cpmsga4vre 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_material 
       add constraint fk6ts531mold2ibya0c038hebea 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_material 
       add constraint fkpab2df5aaru3riy5vxd86uve3 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_material 
       add constraint fkipvr7dsgmt37oig421t41o385 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_material 
       add constraint fkegxevel4526aib74sesmtu25e 
       foreign key (monomer_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_material 
       add constraint fkuvsb9isctq5ela0dqy2hhwti 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table if exists ix_ginas_mixture 
       add constraint fk4tqay4hgaqpm3sq8rx9184jat 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_mixture 
       add constraint fkjfwb6hqmtuoadhdx7wpkhxaju 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_mixture 
       add constraint fko0yqo20vk9l8tqybgp75o23km 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_modifications 
       add constraint fknt72fojjxifrwa7bfwjw8cpm5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_modifications 
       add constraint fkpod9b4pm2tw1e4llfvayoivw4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_moiety 
       add constraint fkkw3ljg8rkiv07pcn0o0n3o02a 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_moiety 
       add constraint fk3a5dgbi1pmatnvuta5a4wy3aq 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_moiety 
       add constraint fkf0mktcfnu1ly1x7ubmf41lh2n 
       foreign key (count_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_moiety 
       add constraint fk8olyp6rpiq8yxtuk3mxsnbels 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_moiety 
       add constraint fkc3r993grtkv5al4opvpv554ga 
       foreign key (structure_id) 
       references ix_core_structure

    alter table if exists ix_ginas_name 
       add constraint fklhhdrsy7v2qr1amwmw0981mv2 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_name 
       add constraint fkgwls3gldgeqmgliev3kcvhjml 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_name 
       add constraint fkeqm42ow1b2o1c3uhu3d1k2efm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_nameorg 
       add constraint fkk77bj1lax07ocd00s3sfmn6ot 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_nameorg 
       add constraint fkm5w47bga21kw55x56q7jbbguj 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_nameorg 
       add constraint fkqtmeq2vb6siyu40vxnw4c8vq 
       foreign key (owner_uuid) 
       references ix_ginas_name

    alter table if exists ix_ginas_note 
       add constraint fkge1aq2fv84ucy1ilwx97vpuwu 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_note 
       add constraint fkpg2o4yxwwlbbw1rro1c5df60 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_note 
       add constraint fkj3nrt8342rqojj5d4k24w5tgm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_nucleicacid 
       add constraint fkm9yv3dunytjgyjfiq6r503lyr 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_nucleicacid 
       add constraint fk6jk9rw9co4676wg98pvseggxc 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_nucleicacid 
       add constraint fkck0ay4di4y12vsqd9gqw4qh4b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table if exists ix_ginas_nucleicacid_subunits 
       add constraint fkjun57ycd07jv8oe3h8566r488 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table if exists ix_ginas_nucleicacid_subunits 
       add constraint fkdby8ustw4fo38x6e98cg814td 
       foreign key (ix_ginas_nucleicacid_uuid) 
       references ix_ginas_nucleicacid

    alter table if exists ix_ginas_otherlinks 
       add constraint fk9sukhdr4s0yje92m8hp82hitx 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_otherlinks 
       add constraint fkigwh0j2irewbpsb1xgael3pim 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_otherlinks 
       add constraint fkdub4td7p5ki0u4dl83j4u9ysr 
       foreign key (owner_uuid) 
       references ix_ginas_protein

    alter table if exists ix_ginas_otherlinks 
       add constraint fk5nj85bcu54jc56se3hm4q3chm 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_parameter 
       add constraint fklbuqth4cgx61sh4rcci2mdl1o 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_parameter 
       add constraint fklj93g1oplslasut6r924dft2l 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_parameter 
       add constraint fk9ixg1ch1e0hueyta2dh4vlidg 
       foreign key (owner_uuid) 
       references ix_ginas_property

    alter table if exists ix_ginas_parameter 
       add constraint fkdxnyu34iqqponnw4bnj9hk8rb 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_parameter 
       add constraint fkix1d880p7x7v51quhcre616af 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_physicalmod 
       add constraint fk32ojpkiiy03fk8ro0eyclrbkh 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_physicalmod 
       add constraint fk23yuiouuyqodtlxmjxopv0ybf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_physicalmod 
       add constraint fkd8fg9mm0ilkfdii08s5qsonde 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table if exists ix_ginas_physicalpar 
       add constraint fkrfgl3mys5n5wiknd32enb7hmb 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_physicalpar 
       add constraint fkd1w1xyqt12divo39phpoi2113 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_physicalpar 
       add constraint fk4ce1vbnehe206ru4gctnlkidh 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_physicalpar 
       add constraint fk1e30fjxi7rv1m875713tges77 
       foreign key (owner_uuid) 
       references ix_ginas_physicalmod

    alter table if exists ix_ginas_polymer 
       add constraint fk8axkm0cbpwpc43krkhw8y6tad 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_polymer 
       add constraint fk5o81f597yvub0mf1b6cnqx8ev 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_polymer 
       add constraint fktn8tft3hwqnpv8tkfhtbh5jsm 
       foreign key (classification_uuid) 
       references polymer_classification

    alter table if exists ix_ginas_polymer 
       add constraint fkcd56mdyyo9bvrrd80w0y8iixl 
       foreign key (display_structure_id) 
       references ix_core_structure

    alter table if exists ix_ginas_polymer 
       add constraint fk264hsvr9c8q3w1e51j99ua2d0 
       foreign key (idealized_structure_id) 
       references ix_core_structure

    alter table if exists ix_ginas_property 
       add constraint fktla10hxba7smca0g675soamsq 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_property 
       add constraint fkafltirwo87s1so6vigtf1s8mn 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_property 
       add constraint fkrlu3e72lq9y59122xd75q51vt 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_property 
       add constraint fkoh8nhvrowpdthcxj69pwkke9t 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_property 
       add constraint fkpbekqdofak8ol2fq92f5onn1t 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_protein 
       add constraint fk6ay15bqty5r2xmk13a4ld75rm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_protein 
       add constraint fkpovxe3t3ycsa1x6xivr20ukbh 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_protein 
       add constraint fkec7ms0paeosyymbpsnbu5pjfb 
       foreign key (glycosylation_uuid) 
       references ix_ginas_glycosylation

    alter table if exists ix_ginas_protein_subunit 
       add constraint fklk7qxuwt9o7g8k6rphr5jj7ey 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table if exists ix_ginas_protein_subunit 
       add constraint fk39xyg6fxghld06apb91xc1xt6 
       foreign key (ix_ginas_protein_uuid) 
       references ix_ginas_protein

    alter table if exists ix_ginas_reference 
       add constraint fkpv1epn9el8d1fpqct4px1nio7 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_reference 
       add constraint fk975dqn3b674b23ga0igmmct25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_reference 
       add constraint fkk7kui3q4qm7pwdq679ibkyi5h 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_relationship 
       add constraint fk70gmjxu8uevujxd4uetj6nfm3 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_relationship 
       add constraint fkmsd9lm6ayae7qbwp1iv50ftbb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_relationship 
       add constraint fk492eul84p3uecmkpqmd8ujvkb 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_relationship 
       add constraint fksim8mqlrevhpl0aa0hrdh3wwe 
       foreign key (mediator_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_relationship 
       add constraint fkr1msd0rheudj2srgokqrftrek 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_relationship 
       add constraint fkb6yhrsc7dprxg0apyknpue5ij 
       foreign key (related_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_site_lob 
       add constraint fkfbc7le8ehsxj39t2yikmmy3py 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_site_lob 
       add constraint fkh2cg1v3f9ha8t0w4l8iprib2g 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_ssg1 
       add constraint fk3tljtp4q2e94j2q27hgnnhse4 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_ssg1 
       add constraint fkle7gsf4fuf75tsrvksgvkjc25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_ssg3 
       add constraint fkphwuwyutg3qw0m6sltk2k313k 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_ssg3 
       add constraint fk8wpbv2gmw0rr6a0pywbvac0i5 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_ssg3 
       add constraint fk330e5sasucjp4134wpwtu8lwb 
       foreign key (definition_uuid) 
       references ix_ginas_definition

    alter table if exists ix_ginas_ssg3 
       add constraint fklbcuwggmsgljs9ft8rg5e04te 
       foreign key (grade_uuid) 
       references ix_ginas_ssg3_grade

    alter table if exists ix_ginas_ssg3 
       add constraint fk769l9w19w81s2hyvsi4o65evx 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_ssg3_grade 
       add constraint fknxhvkenjdx6shmj1qfw7em6sc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_ssg3_grade 
       add constraint fknyx3tbg0b5biha79eybm68heb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_strucdiv 
       add constraint fkqpk4af5q91r4nsm521kd57298 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_strucdiv 
       add constraint fk4epq4o38ci57y71dxu7ootl41 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_strucdiv 
       add constraint fkhh72pwq35aaqgv370uavhtnjh 
       foreign key (maternal_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_strucdiv 
       add constraint fk6lcu1945kbaxi6fmir3qt5ugk 
       foreign key (paternal_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_strucdiv 
       add constraint fk27p7qapsxr5d2efscf8k7521 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_structuralmod 
       add constraint fkndd0pxjud610e953hg730emw 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_structuralmod 
       add constraint fk1ysjs1dx6uo8flj8rkiscscx4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_structuralmod 
       add constraint fktkmtm9vpmaklmypp3jad1pspp 
       foreign key (extent_amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_structuralmod 
       add constraint fk6n3mtotuwqi717fr2evp3dfxi 
       foreign key (molecular_fragment_uuid) 
       references ix_ginas_substanceref

    alter table if exists ix_ginas_structuralmod 
       add constraint fkoi4vt2lg0x2v3s4urckwjb3s3 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table if exists ix_ginas_structuralmod 
       add constraint fkb94sjca6cclvcwtx2osvdeuu 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_substance 
       add constraint fka9b6lpf9y3l0t04rviskjs8o1 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_substance 
       add constraint fk9hlo5n1alfg4rgloypq8agc3e 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_substance 
       add constraint fkmb0vxvmui506xtkh18lw1ucym 
       foreign key (approved_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_substance 
       add constraint fk30b2jg1r8dr4ibvt3f4h7ui3b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table if exists ix_ginas_substance 
       add constraint fkau9cajhw1nffg9w1vh0am4ls4 
       foreign key (structure_id) 
       references ix_core_structure

    alter table if exists ix_ginas_substance 
       add constraint fkekk08a5uheng9eocf61xo4m2l 
       foreign key (mixture_uuid) 
       references ix_ginas_mixture

    alter table if exists ix_ginas_substance 
       add constraint fk8lglxcodtpv6nj0wbw61cpdk9 
       foreign key (nucleic_acid_uuid) 
       references ix_ginas_nucleicacid

    alter table if exists ix_ginas_substance 
       add constraint fkncdqbv3ilcg21bws3e3y0xwg4 
       foreign key (polymer_uuid) 
       references ix_ginas_polymer

    alter table if exists ix_ginas_substance 
       add constraint fkcw3qqer4es16onh3qgcuf6jb8 
       foreign key (protein_uuid) 
       references ix_ginas_protein

    alter table if exists ix_ginas_substance 
       add constraint fkd29meikxu3elfx1w5dket3ia5 
       foreign key (specified_substance_uuid) 
       references ix_ginas_ssg1

    alter table if exists ix_ginas_substance 
       add constraint fkvubtca9k1urb0aqv6awf7evk 
       foreign key (specified_substance_g3_uuid) 
       references ix_ginas_ssg3

    alter table if exists ix_ginas_substance 
       add constraint fkhrs798kf99tmayeg8hjbo9vdl 
       foreign key (structurally_diverse_uuid) 
       references ix_ginas_strucdiv

    alter table if exists ix_ginas_substance_mix_comp 
       add constraint fkjsfcmh12rru7tls24cbkbmb0t 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table if exists ix_ginas_substance_mix_comp 
       add constraint fkpubptahgdm25hadwlf3pwlfap 
       foreign key (ix_ginas_mixture_uuid) 
       references ix_ginas_mixture

    alter table if exists ix_ginas_substance_ss_comp 
       add constraint fkb8ofx08elpr455o7a72rrr9tm 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table if exists ix_ginas_substance_ss_comp 
       add constraint fkaf57kow6qnxnp2ya35n21jiyo 
       foreign key (ix_ginas_ssg1_uuid) 
       references ix_ginas_ssg1

    alter table if exists ix_ginas_substance_tags 
       add constraint fkjlsvy9nlwl3vf5mvhcvf0y80k 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table if exists ix_ginas_substance_tags 
       add constraint fk2hyjvdeqia2qiemoagh6yjq6b 
       foreign key (ix_ginas_substance_uuid) 
       references ix_ginas_substance

    alter table if exists ix_ginas_substanceref 
       add constraint fko2bjxrp2qi847appx7ecf65vc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_substanceref 
       add constraint fkm6qbi1moehd7wqh9w2ip412us 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_subunit 
       add constraint fk7kjfdjus3twoyg4vd2jp367n6 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_subunit 
       add constraint fk9pyegqu1n4ekd45fdmitw12t7 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_sugar 
       add constraint fke6ndxx94bjimsgux4lygsh51f 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_sugar 
       add constraint fk1p4pfd811kxxjqfxbiuu9sknv 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_sugar 
       add constraint fkkx0aeyak8r0byugf719kqu7ms 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table if exists ix_ginas_sugar 
       add constraint fkpx5dhn0168ipbpu04xgmby97y 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table if exists ix_ginas_unit 
       add constraint fkl4qe419byvtxe3epgd4a50glc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_unit 
       add constraint fknbsd63mfulnly1dtk7f6vxcq4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists ix_ginas_unit 
       add constraint fkq8b5gi5r7thxi8vyrli5lrtu2 
       foreign key (amap_id) 
       references ix_core_value

    alter table if exists ix_ginas_unit 
       add constraint fk2x4h6n93ud35rtm5nxt7xrcmw 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table if exists ix_ginas_unit 
       add constraint fkf3rxpagehygabef32q3kn4am 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table if exists polymer_classification 
       add constraint fk9tp2yhc5vdofsdnx5cit45hdy 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table if exists polymer_classification 
       add constraint fk6bup6ku2dri7cl4rgno4fd6dd 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table if exists polymer_classification 
       add constraint fkl3chbblh2guqlw9ikn9grc3vb 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref
create sequence ix_core_acl_seq start with 1 increment by 1
create sequence ix_core_backup_seq start with 1 increment by 1
create sequence ix_core_etag_seq start with 1 increment by 1
create sequence ix_core_group_seq start with 1 increment by 1
create sequence ix_core_namespace_seq start with 1 increment by 1
create sequence ix_core_principal_seq start with 1 increment by 1
create sequence ix_core_userprof_seq start with 1 increment by 1
create sequence ix_core_value_seq start with 1 increment by 1
create sequence ix_core_xref_seq start with 1 increment by 1

    create table ix_core_acl (
       id bigint not null,
        perm integer,
        primary key (id)
    )

    create table ix_core_acl_group (
       ix_core_acl_id bigint not null,
        ix_core_group_id bigint not null
    )

    create table ix_core_acl_principal (
       ix_core_acl_id bigint not null,
        ix_core_principal_id bigint not null
    )

    create table ix_core_backup (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        compressed boolean not null,
        data binary(255),
        kind varchar(255),
        refid varchar(255),
        sha1 varchar(255),
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_edit (
       id binary not null,
        batch varchar(64),
        comments varchar(2147483647),
        created bigint,
        kind varchar(255),
        new_value varchar(2147483647),
        old_value varchar(2147483647),
        path varchar(1024),
        refid varchar(255),
        version varchar(255),
        editor_id bigint,
        primary key (id)
    )

    create table ix_core_etag (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        count integer,
        etag varchar(16),
        filter varchar(4000),
        method varchar(10),
        path varchar(255),
        query varchar(2048),
        sha1 varchar(40),
        skip integer,
        status integer,
        top integer,
        total integer,
        uri varchar(4000),
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_figure (
       DTYPE varchar(31) not null,
        id bigint not null,
        caption varchar(255),
        data binary(255),
        mime_type varchar(255),
        sha1 varchar(140),
        data_size integer,
        url varchar(1024),
        parent_id bigint,
        primary key (id)
    )

    create table ix_core_filedata (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        data binary(255),
        mime_type varchar(255),
        sha1 varchar(140),
        data_size bigint,
        primary key (id)
    )

    create table ix_core_group (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table ix_core_group_principal (
       ix_core_group_id bigint not null,
        ix_core_principal_id bigint not null,
        primary key (ix_core_group_id, ix_core_principal_id)
    )

    create table ix_core_namespace (
       id bigint not null,
        location varchar(1024),
        modifier integer,
        name varchar(255),
        owner_id bigint,
        primary key (id)
    )

    create table ix_core_payload (
       id varchar(40) not null,
        created timestamp,
        mime_type varchar(128),
        name varchar(1024),
        sha1 varchar(40),
        capacity bigint,
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_payload_property (
       ix_core_payload_id varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_principal (
       id bigint not null,
        is_admin boolean,
        created timestamp,
        deprecated boolean not null,
        email varchar(255),
        modified timestamp,
        provider varchar(255),
        uri varchar(1024),
        username varchar(255),
        version bigint,
        selfie_id bigint,
        primary key (id)
    )

    create table ix_core_structure (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        atropi integer,
        charge integer,
        count integer,
        created timestamp,
        defined_stereo integer,
        deprecated boolean not null,
        digest varchar(128),
        ez_centers integer,
        formula varchar(255),
        last_edited timestamp,
        molfile varchar(2147483647),
        mwt double,
        optical integer,
        smiles varchar(2147483647),
        stereo_centers integer,
        stereo varchar(255),
        stereo_comments varchar(2147483647),
        version bigint,
        internal_references clob,
        record_access longvarbinary,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (id)
    )

    create table ix_core_structure_link (
       ix_core_structure_id varchar(40) not null,
        ix_core_xref_id bigint not null
    )

    create table ix_core_structure_property (
       ix_core_structure_id varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_userprof (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        active boolean not null,
        hashp varchar(255),
        apikey varchar(255),
        ROLES_JSON varchar(2147483647),
        salt varchar(255),
        system_auth boolean not null,
        namespace_id bigint,
        user_id bigint,
        primary key (id)
    )

    create table ix_core_userprof_prop (
       ix_core_userprof_id bigint not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_value (
       DTYPE varchar(31) not null,
        id bigint not null,
        label varchar(255),
        heading varchar(1024),
        major_topic boolean,
        text varchar(2147483647),
        href varchar(2147483647),
        term varchar(255),
        data binary(255),
        mime_type varchar(32),
        sha1 varchar(40),
        data_size integer,
        intval bigint,
        numval double,
        unit varchar(255),
        average double,
        lval double,
        rval double,
        strval varchar(1024),
        primary key (id)
    )

    create table ix_core_xref (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        kind varchar(255) not null,
        refid varchar(40) not null,
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_xref_property (
       ix_core_xref_id bigint not null,
        ix_core_value_id bigint not null
    )

    create table ix_ginas_agentmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        agent_modification_process varchar(255),
        agent_modification_role varchar(255),
        agent_modification_type varchar(255),
        modification_group varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        agent_substance_uuid varchar(40),
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_amount (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        approval_id varchar(10),
        average double,
        high double,
        high_limit double,
        low double,
        low_limit double,
        non_numeric_value varchar(255),
        type varchar(255),
        units varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_code (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        code varchar(255) not null,
        code_system varchar(255),
        code_text varchar(2147483647),
        comments varchar(2147483647),
        type varchar(255),
        url varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_component (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        type varchar(255),
        role varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        substance_uuid varchar(40),
        amount_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_definition (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        definition varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_glycosylation (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        glycosylation_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        c_glycosylation_sites_uuid varchar(40),
        n_glycosylation_sites_uuid varchar(40),
        o_glycosylation_sites_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_linkage (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        linkage varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_material (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        defining boolean,
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        monomer_substance_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_mixture (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_modifications (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_moiety (
       inner_uuid varchar(255) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        uuid binary,
        created_by_id bigint,
        last_edited_by_id bigint,
        count_uuid varchar(40),
        owner_uuid varchar(40),
        structure_id varchar(40),
        primary key (inner_uuid)
    )

    create table ix_ginas_name (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        display_name boolean not null,
        domains clob,
        full_name varchar(2147483647),
        languages clob,
        name varchar(255) not null,
        name_jurisdiction clob,
        preferred boolean not null,
        std_name varchar(2147483647),
        type varchar(32),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nameorg (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        deprecated_date timestamp,
        name_org varchar(255) not null,
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_note (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        note varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        nucleic_acid_sub_type varchar(255),
        nucleic_acid_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        modifications_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid_subunits (
       ix_ginas_nucleicacid_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_otherlinks (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        linkage_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_parameter (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        name varchar(255) not null,
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        modification_group varchar(255),
        physical_modification_role varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalpar (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        parameter_name varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_polymer (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        classification_uuid varchar(40),
        display_structure_id varchar(40),
        idealized_structure_id varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_property (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        defining boolean,
        name varchar(255) not null,
        property_type varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        disulf_json varchar(2147483647),
        protein_sub_type varchar(255),
        protein_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        glycosylation_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein_subunit (
       ix_ginas_protein_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_reference (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        citation varchar(2147483647),
        doc_type varchar(255),
        document_date timestamp,
        id varchar(255),
        public_domain boolean not null,
        tags clob,
        uploaded_file varchar(1024),
        url varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_relationship (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        comments varchar(2147483647),
        interaction_type varchar(255),
        originator_uuid varchar(255),
        qualification varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        mediator_substance_uuid varchar(40),
        owner_uuid varchar(40),
        related_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_site_lob (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        site_count bigint not null,
        site_type varchar(255),
        sites_json varchar(2147483647),
        sites_short_hand varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_ssg1 (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_ssg3 (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        definition_uuid varchar(40),
        grade_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_ssg3_grade (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        name varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_strucdiv (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        developmental_stage varchar(255),
        fraction_material_type varchar(255),
        fraction_name varchar(255),
        infra_specific_name varchar(255),
        infra_specific_type varchar(255),
        organism_author varchar(255),
        organism_family varchar(255),
        organism_genus varchar(255),
        organism_species varchar(255),
        part clob,
        part_location varchar(255),
        source_material_class varchar(255),
        source_material_state varchar(255),
        source_material_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        maternal_uuid varchar(40),
        paternal_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_structuralmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        extent varchar(255),
        location_type varchar(255),
        modification_group varchar(255),
        moleculare_fragment_role varchar(255),
        residue_modified varchar(255),
        structural_modification_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        extent_amount_uuid varchar(40),
        molecular_fragment_uuid varchar(40),
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        approval_id varchar(20),
        approved timestamp,
        change_reason varchar(255),
        definition_level integer,
        definition_type integer,
        status varchar(255),
        class integer,
        version varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        approved_by_id bigint,
        modifications_uuid varchar(40),
        structure_id varchar(40),
        mixture_uuid varchar(40),
        nucleic_acid_uuid varchar(40),
        polymer_uuid varchar(40),
        protein_uuid varchar(40),
        specified_substance_uuid varchar(40),
        specified_substance_g3_uuid varchar(40),
        structurally_diverse_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance_mix_comp (
       ix_ginas_mixture_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_ss_comp (
       ix_ginas_ssg1_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_tags (
       ix_ginas_substance_uuid varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_ginas_substanceref (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        approval_ID varchar(32),
        ref_pname varchar(1024),
        refuuid varchar(128),
        substance_class varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_subunit (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        sequence varchar(2147483647),
        subunit_index integer,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_sugar (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        sugar varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_unit (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        attachmentMap varchar(2147483647),
        attachment_count integer,
        label varchar(255),
        structure varchar(2147483647),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amap_id bigint,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table polymer_classification (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        polymer_class varchar(255),
        polymer_geometry varchar(255),
        polymer_subclass clob,
        source_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    alter table ix_core_backup 
       add constraint UK_6n0ebodjb5t7yoxowli7t5qud unique (refid)

    alter table ix_core_etag 
       add constraint UK_hvark3ftc0xax8dcbjuftcn7v unique (etag)

    alter table ix_core_group 
       add constraint UK_pm62da77mybok0t03dd0a9oum unique (name)

    alter table ix_core_namespace 
       add constraint UK_t3wv0p58vflh5n2vnj6rjan75 unique (name)

    alter table ix_core_principal 
       add constraint UK_p8p720bdp9bkws54yip7x1t47 unique (username)

    alter table ix_ginas_moiety 
       add constraint UK_8cr4axbsithvjxcfhnltaejsp unique (uuid)

    alter table ix_core_acl_group 
       add constraint fkffablaywfq4inuntnok9otle 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table ix_core_acl_group 
       add constraint fk8a5l9ehfusnoigq1r4robs2da 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table ix_core_acl_principal 
       add constraint fkpf5d4mu9td8et6k5pgt78jma8 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table ix_core_acl_principal 
       add constraint fkc9bo2bwjfcf7djff6coigl2b1 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table ix_core_backup 
       add constraint fknulpohkjr0e7imml16hnmcl2c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_edit 
       add constraint fkj2b3ncg8uek4q4tjua17gvkgi 
       foreign key (editor_id) 
       references ix_core_principal

    alter table ix_core_etag 
       add constraint fk22kqxphqlg1d1hmsi2wtm6k0c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_figure 
       add constraint fk911xrg14bag2m8e096i9d75lu 
       foreign key (parent_id) 
       references ix_core_figure

    alter table ix_core_group_principal 
       add constraint fkp21u3ryjg094idoi9alrg90p7 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table ix_core_group_principal 
       add constraint fk1voeekm54sy5sc3et2fqo0unx 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table ix_core_namespace 
       add constraint fkdgo5yjubgilh1nauv1t69gslx 
       foreign key (owner_id) 
       references ix_core_principal

    alter table ix_core_payload 
       add constraint fkd150c5llpyncrqgpmqvvj8c9g 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_payload_property 
       add constraint fki6ubcj55u3pq0gm70ay7umle1 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_payload_property 
       add constraint fk6j2diflggrmws0k3suo8ms215 
       foreign key (ix_core_payload_id) 
       references ix_core_payload

    alter table ix_core_principal 
       add constraint fk6th1516rd9u5crfw7r12qtypk 
       foreign key (selfie_id) 
       references ix_core_figure

    alter table ix_core_structure 
       add constraint fksobht0ese9794r3q9k1q6i7gp 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_core_structure 
       add constraint fk37rfonx9x7vmkwsru7dxxqhhk 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_core_structure_link 
       add constraint fkdca3xgv2a5p344i74yc7sk89v 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table ix_core_structure_link 
       add constraint fk44si68uocnubt6vaobd4mgmmy 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table ix_core_structure_property 
       add constraint fk4n49941jj4uufoosy5n1g9rg6 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_structure_property 
       add constraint fkok4h9jsov59dh00wnrmsnd12x 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table ix_core_userprof 
       add constraint fks5bqupbwldu7843qnt8tuntnu 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_userprof 
       add constraint fknq0obnfqd9j3uh1uxdqn3ouq7 
       foreign key (user_id) 
       references ix_core_principal

    alter table ix_core_userprof_prop 
       add constraint fknfow9qqryxbxgppprcum5khf8 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_userprof_prop 
       add constraint fklloqe5wbjywhajh4tw6ilfnvg 
       foreign key (ix_core_userprof_id) 
       references ix_core_userprof

    alter table ix_core_xref 
       add constraint fk6g9t8ugidjwe166t5nk7x2wqm 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_xref_property 
       add constraint fkaucrto6dcvyyq1n6jo332gqsf 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_xref_property 
       add constraint fkmr6or6lteb684kq2e1dgsxl1w 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table ix_ginas_agentmod 
       add constraint fk837ol47m9wstcu74fp5toniam 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_agentmod 
       add constraint fk2prhrnc5vlo55jxu1rxgpfdw1 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_agentmod 
       add constraint fk2x5f4lw85tpkym1r3urwp2u3w 
       foreign key (agent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_agentmod 
       add constraint fki7hwi4cyu1hi7yjo2ddwkig51 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_agentmod 
       add constraint fk9ybw4linkblw3p4u25cq6qs0d 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_amount 
       add constraint fkqsmrbuknll0fmv6jthf4cycy5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_amount 
       add constraint fk9leptgx7incy9twmrwcpeo2bm 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fkfwn6blkrhusg1xhrue0u820p 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fkpio633txjf8p5soyujcrtbx9v 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fke9p0ygr5drc93bxry80f9y215 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_component 
       add constraint fkodvtp4qvwc7nyfr3lbc893o6m 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_component 
       add constraint fkbbvqudmdnm60le1imuwb2uj5x 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_component 
       add constraint fkql4nn094peyvxrwctj1ga2wp2 
       foreign key (substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_component 
       add constraint fksqa51pxp5tbk6vyu34qbr8c5u 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_definition 
       add constraint fk4kcslc98jcqx137enxl5fgs5t 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_definition 
       add constraint fk9wxg9p9i1bi7qoxfcu9gkg9og 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fk6dapjdumuglm11xxawpupefqm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fkpglm1avjx8n78aom78j3ju3bf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fkqiim2s89ddjuxbkhpv3xa023j 
       foreign key (c_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_glycosylation 
       add constraint fkffabrw84stgayaui9g1a4wk1g 
       foreign key (n_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_glycosylation 
       add constraint fkmt1ufykgpny0dlxj36h6tgxwr 
       foreign key (o_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_linkage 
       add constraint fkq619bp0y4e8y3c6efgyp2k8ux 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_linkage 
       add constraint fkfctm6wmaejthxy8y5gtbaqd80 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_linkage 
       add constraint fkotqo99g96i7epg4s384xushll 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_linkage 
       add constraint fkaao7lfx6xsyc4l1cpmsga4vre 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_material 
       add constraint fk6ts531mold2ibya0c038hebea 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_material 
       add constraint fkpab2df5aaru3riy5vxd86uve3 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_material 
       add constraint fkipvr7dsgmt37oig421t41o385 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_material 
       add constraint fkegxevel4526aib74sesmtu25e 
       foreign key (monomer_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_material 
       add constraint fkuvsb9isctq5ela0dqy2hhwti 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table ix_ginas_mixture 
       add constraint fk4tqay4hgaqpm3sq8rx9184jat 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_mixture 
       add constraint fkjfwb6hqmtuoadhdx7wpkhxaju 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_mixture 
       add constraint fko0yqo20vk9l8tqybgp75o23km 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_modifications 
       add constraint fknt72fojjxifrwa7bfwjw8cpm5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_modifications 
       add constraint fkpod9b4pm2tw1e4llfvayoivw4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fkkw3ljg8rkiv07pcn0o0n3o02a 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fk3a5dgbi1pmatnvuta5a4wy3aq 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fkf0mktcfnu1ly1x7ubmf41lh2n 
       foreign key (count_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_moiety 
       add constraint fk8olyp6rpiq8yxtuk3mxsnbels 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_moiety 
       add constraint fkc3r993grtkv5al4opvpv554ga 
       foreign key (structure_id) 
       references ix_core_structure

    alter table ix_ginas_name 
       add constraint fklhhdrsy7v2qr1amwmw0981mv2 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_name 
       add constraint fkgwls3gldgeqmgliev3kcvhjml 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_name 
       add constraint fkeqm42ow1b2o1c3uhu3d1k2efm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_nameorg 
       add constraint fkk77bj1lax07ocd00s3sfmn6ot 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_nameorg 
       add constraint fkm5w47bga21kw55x56q7jbbguj 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_nameorg 
       add constraint fkqtmeq2vb6siyu40vxnw4c8vq 
       foreign key (owner_uuid) 
       references ix_ginas_name

    alter table ix_ginas_note 
       add constraint fkge1aq2fv84ucy1ilwx97vpuwu 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_note 
       add constraint fkpg2o4yxwwlbbw1rro1c5df60 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_note 
       add constraint fkj3nrt8342rqojj5d4k24w5tgm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_nucleicacid 
       add constraint fkm9yv3dunytjgyjfiq6r503lyr 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_nucleicacid 
       add constraint fk6jk9rw9co4676wg98pvseggxc 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_nucleicacid 
       add constraint fkck0ay4di4y12vsqd9gqw4qh4b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_nucleicacid_subunits 
       add constraint fkjun57ycd07jv8oe3h8566r488 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table ix_ginas_nucleicacid_subunits 
       add constraint fkdby8ustw4fo38x6e98cg814td 
       foreign key (ix_ginas_nucleicacid_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_otherlinks 
       add constraint fk9sukhdr4s0yje92m8hp82hitx 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_otherlinks 
       add constraint fkigwh0j2irewbpsb1xgael3pim 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_otherlinks 
       add constraint fkdub4td7p5ki0u4dl83j4u9ysr 
       foreign key (owner_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_otherlinks 
       add constraint fk5nj85bcu54jc56se3hm4q3chm 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_parameter 
       add constraint fklbuqth4cgx61sh4rcci2mdl1o 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_parameter 
       add constraint fklj93g1oplslasut6r924dft2l 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_parameter 
       add constraint fk9ixg1ch1e0hueyta2dh4vlidg 
       foreign key (owner_uuid) 
       references ix_ginas_property

    alter table ix_ginas_parameter 
       add constraint fkdxnyu34iqqponnw4bnj9hk8rb 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_parameter 
       add constraint fkix1d880p7x7v51quhcre616af 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_physicalmod 
       add constraint fk32ojpkiiy03fk8ro0eyclrbkh 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalmod 
       add constraint fk23yuiouuyqodtlxmjxopv0ybf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalmod 
       add constraint fkd8fg9mm0ilkfdii08s5qsonde 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_physicalpar 
       add constraint fkrfgl3mys5n5wiknd32enb7hmb 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalpar 
       add constraint fkd1w1xyqt12divo39phpoi2113 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalpar 
       add constraint fk4ce1vbnehe206ru4gctnlkidh 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_physicalpar 
       add constraint fk1e30fjxi7rv1m875713tges77 
       foreign key (owner_uuid) 
       references ix_ginas_physicalmod

    alter table ix_ginas_polymer 
       add constraint fk8axkm0cbpwpc43krkhw8y6tad 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_polymer 
       add constraint fk5o81f597yvub0mf1b6cnqx8ev 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_polymer 
       add constraint fktn8tft3hwqnpv8tkfhtbh5jsm 
       foreign key (classification_uuid) 
       references polymer_classification

    alter table ix_ginas_polymer 
       add constraint fkcd56mdyyo9bvrrd80w0y8iixl 
       foreign key (display_structure_id) 
       references ix_core_structure

    alter table ix_ginas_polymer 
       add constraint fk264hsvr9c8q3w1e51j99ua2d0 
       foreign key (idealized_structure_id) 
       references ix_core_structure

    alter table ix_ginas_property 
       add constraint fktla10hxba7smca0g675soamsq 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_property 
       add constraint fkafltirwo87s1so6vigtf1s8mn 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_property 
       add constraint fkrlu3e72lq9y59122xd75q51vt 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_property 
       add constraint fkoh8nhvrowpdthcxj69pwkke9t 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_property 
       add constraint fkpbekqdofak8ol2fq92f5onn1t 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_protein 
       add constraint fk6ay15bqty5r2xmk13a4ld75rm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_protein 
       add constraint fkpovxe3t3ycsa1x6xivr20ukbh 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_protein 
       add constraint fkec7ms0paeosyymbpsnbu5pjfb 
       foreign key (glycosylation_uuid) 
       references ix_ginas_glycosylation

    alter table ix_ginas_protein_subunit 
       add constraint fklk7qxuwt9o7g8k6rphr5jj7ey 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table ix_ginas_protein_subunit 
       add constraint fk39xyg6fxghld06apb91xc1xt6 
       foreign key (ix_ginas_protein_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_reference 
       add constraint fkpv1epn9el8d1fpqct4px1nio7 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_reference 
       add constraint fk975dqn3b674b23ga0igmmct25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_reference 
       add constraint fkk7kui3q4qm7pwdq679ibkyi5h 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_relationship 
       add constraint fk70gmjxu8uevujxd4uetj6nfm3 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_relationship 
       add constraint fkmsd9lm6ayae7qbwp1iv50ftbb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_relationship 
       add constraint fk492eul84p3uecmkpqmd8ujvkb 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_relationship 
       add constraint fksim8mqlrevhpl0aa0hrdh3wwe 
       foreign key (mediator_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_relationship 
       add constraint fkr1msd0rheudj2srgokqrftrek 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_relationship 
       add constraint fkb6yhrsc7dprxg0apyknpue5ij 
       foreign key (related_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_site_lob 
       add constraint fkfbc7le8ehsxj39t2yikmmy3py 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_site_lob 
       add constraint fkh2cg1v3f9ha8t0w4l8iprib2g 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg1 
       add constraint fk3tljtp4q2e94j2q27hgnnhse4 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg1 
       add constraint fkle7gsf4fuf75tsrvksgvkjc25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fkphwuwyutg3qw0m6sltk2k313k 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fk8wpbv2gmw0rr6a0pywbvac0i5 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fk330e5sasucjp4134wpwtu8lwb 
       foreign key (definition_uuid) 
       references ix_ginas_definition

    alter table ix_ginas_ssg3 
       add constraint fklbcuwggmsgljs9ft8rg5e04te 
       foreign key (grade_uuid) 
       references ix_ginas_ssg3_grade

    alter table ix_ginas_ssg3 
       add constraint fk769l9w19w81s2hyvsi4o65evx 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_ssg3_grade 
       add constraint fknxhvkenjdx6shmj1qfw7em6sc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3_grade 
       add constraint fknyx3tbg0b5biha79eybm68heb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fkqpk4af5q91r4nsm521kd57298 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fk4epq4o38ci57y71dxu7ootl41 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fkhh72pwq35aaqgv370uavhtnjh 
       foreign key (maternal_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_strucdiv 
       add constraint fk6lcu1945kbaxi6fmir3qt5ugk 
       foreign key (paternal_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_strucdiv 
       add constraint fk27p7qapsxr5d2efscf8k7521 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_structuralmod 
       add constraint fkndd0pxjud610e953hg730emw 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_structuralmod 
       add constraint fk1ysjs1dx6uo8flj8rkiscscx4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_structuralmod 
       add constraint fktkmtm9vpmaklmypp3jad1pspp 
       foreign key (extent_amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_structuralmod 
       add constraint fk6n3mtotuwqi717fr2evp3dfxi 
       foreign key (molecular_fragment_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_structuralmod 
       add constraint fkoi4vt2lg0x2v3s4urckwjb3s3 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_structuralmod 
       add constraint fkb94sjca6cclvcwtx2osvdeuu 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_substance 
       add constraint fka9b6lpf9y3l0t04rviskjs8o1 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fk9hlo5n1alfg4rgloypq8agc3e 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fkmb0vxvmui506xtkh18lw1ucym 
       foreign key (approved_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fk30b2jg1r8dr4ibvt3f4h7ui3b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_substance 
       add constraint fkau9cajhw1nffg9w1vh0am4ls4 
       foreign key (structure_id) 
       references ix_core_structure

    alter table ix_ginas_substance 
       add constraint fkekk08a5uheng9eocf61xo4m2l 
       foreign key (mixture_uuid) 
       references ix_ginas_mixture

    alter table ix_ginas_substance 
       add constraint fk8lglxcodtpv6nj0wbw61cpdk9 
       foreign key (nucleic_acid_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_substance 
       add constraint fkncdqbv3ilcg21bws3e3y0xwg4 
       foreign key (polymer_uuid) 
       references ix_ginas_polymer

    alter table ix_ginas_substance 
       add constraint fkcw3qqer4es16onh3qgcuf6jb8 
       foreign key (protein_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_substance 
       add constraint fkd29meikxu3elfx1w5dket3ia5 
       foreign key (specified_substance_uuid) 
       references ix_ginas_ssg1

    alter table ix_ginas_substance 
       add constraint fkvubtca9k1urb0aqv6awf7evk 
       foreign key (specified_substance_g3_uuid) 
       references ix_ginas_ssg3

    alter table ix_ginas_substance 
       add constraint fkhrs798kf99tmayeg8hjbo9vdl 
       foreign key (structurally_diverse_uuid) 
       references ix_ginas_strucdiv

    alter table ix_ginas_substance_mix_comp 
       add constraint fkjsfcmh12rru7tls24cbkbmb0t 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table ix_ginas_substance_mix_comp 
       add constraint fkpubptahgdm25hadwlf3pwlfap 
       foreign key (ix_ginas_mixture_uuid) 
       references ix_ginas_mixture

    alter table ix_ginas_substance_ss_comp 
       add constraint fkb8ofx08elpr455o7a72rrr9tm 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table ix_ginas_substance_ss_comp 
       add constraint fkaf57kow6qnxnp2ya35n21jiyo 
       foreign key (ix_ginas_ssg1_uuid) 
       references ix_ginas_ssg1

    alter table ix_ginas_substance_tags 
       add constraint fkjlsvy9nlwl3vf5mvhcvf0y80k 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_ginas_substance_tags 
       add constraint fk2hyjvdeqia2qiemoagh6yjq6b 
       foreign key (ix_ginas_substance_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_substanceref 
       add constraint fko2bjxrp2qi847appx7ecf65vc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_substanceref 
       add constraint fkm6qbi1moehd7wqh9w2ip412us 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_subunit 
       add constraint fk7kjfdjus3twoyg4vd2jp367n6 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_subunit 
       add constraint fk9pyegqu1n4ekd45fdmitw12t7 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fke6ndxx94bjimsgux4lygsh51f 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fk1p4pfd811kxxjqfxbiuu9sknv 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fkkx0aeyak8r0byugf719kqu7ms 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_sugar 
       add constraint fkpx5dhn0168ipbpu04xgmby97y 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_unit 
       add constraint fkl4qe419byvtxe3epgd4a50glc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_unit 
       add constraint fknbsd63mfulnly1dtk7f6vxcq4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_unit 
       add constraint fkq8b5gi5r7thxi8vyrli5lrtu2 
       foreign key (amap_id) 
       references ix_core_value

    alter table ix_ginas_unit 
       add constraint fk2x4h6n93ud35rtm5nxt7xrcmw 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_unit 
       add constraint fkf3rxpagehygabef32q3kn4am 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table polymer_classification 
       add constraint fk9tp2yhc5vdofsdnx5cit45hdy 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table polymer_classification 
       add constraint fk6bup6ku2dri7cl4rgno4fd6dd 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table polymer_classification 
       add constraint fkl3chbblh2guqlw9ikn9grc3vb 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref
create sequence ix_core_acl_seq start with 1 increment by 1
create sequence ix_core_backup_seq start with 1 increment by 1
create sequence ix_core_etag_seq start with 1 increment by 1
create sequence ix_core_group_seq start with 1 increment by 1
create sequence ix_core_namespace_seq start with 1 increment by 1
create sequence ix_core_principal_seq start with 1 increment by 1
create sequence ix_core_userprof_seq start with 1 increment by 1
create sequence ix_core_value_seq start with 1 increment by 1
create sequence ix_core_xref_seq start with 1 increment by 1

    create table ix_core_acl (
       id bigint not null,
        perm integer,
        primary key (id)
    )

    create table ix_core_acl_group (
       ix_core_acl_id bigint not null,
        ix_core_group_id bigint not null
    )

    create table ix_core_acl_principal (
       ix_core_acl_id bigint not null,
        ix_core_principal_id bigint not null
    )

    create table ix_core_backup (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        compressed boolean not null,
        data binary(255),
        kind varchar(255),
        refid varchar(255),
        sha1 varchar(255),
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_edit (
       id binary not null,
        batch varchar(64),
        comments varchar(2147483647),
        created bigint,
        kind varchar(255),
        new_value varchar(2147483647),
        old_value varchar(2147483647),
        path varchar(1024),
        refid varchar(255),
        version varchar(255),
        editor_id bigint,
        primary key (id)
    )

    create table ix_core_etag (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        count integer,
        etag varchar(16),
        filter varchar(4000),
        method varchar(10),
        path varchar(255),
        query varchar(2048),
        sha1 varchar(40),
        skip integer,
        status integer,
        top integer,
        total integer,
        uri varchar(4000),
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_figure (
       DTYPE varchar(31) not null,
        id bigint not null,
        caption varchar(255),
        data binary(255),
        mime_type varchar(255),
        sha1 varchar(140),
        data_size integer,
        url varchar(1024),
        parent_id bigint,
        primary key (id)
    )

    create table ix_core_filedata (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        data binary(255),
        mime_type varchar(255),
        sha1 varchar(140),
        data_size bigint,
        primary key (id)
    )

    create table ix_core_group (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table ix_core_group_principal (
       ix_core_group_id bigint not null,
        ix_core_principal_id bigint not null,
        primary key (ix_core_group_id, ix_core_principal_id)
    )

    create table ix_core_namespace (
       id bigint not null,
        location varchar(1024),
        modifier integer,
        name varchar(255),
        owner_id bigint,
        primary key (id)
    )

    create table ix_core_payload (
       id varchar(40) not null,
        created timestamp,
        mime_type varchar(128),
        name varchar(1024),
        sha1 varchar(40),
        capacity bigint,
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_payload_property (
       ix_core_payload_id varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_principal (
       id bigint not null,
        is_admin boolean,
        created timestamp,
        deprecated boolean not null,
        email varchar(255),
        modified timestamp,
        provider varchar(255),
        uri varchar(1024),
        username varchar(255),
        version bigint,
        selfie_id bigint,
        primary key (id)
    )

    create table ix_core_structure (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        atropi integer,
        charge integer,
        count integer,
        created timestamp,
        defined_stereo integer,
        deprecated boolean not null,
        digest varchar(128),
        ez_centers integer,
        formula varchar(255),
        last_edited timestamp,
        molfile varchar(2147483647),
        mwt double,
        optical integer,
        smiles varchar(2147483647),
        stereo_centers integer,
        stereo varchar(255),
        stereo_comments varchar(2147483647),
        version bigint,
        internal_references clob,
        record_access longvarbinary,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (id)
    )

    create table ix_core_structure_link (
       ix_core_structure_id varchar(40) not null,
        ix_core_xref_id bigint not null
    )

    create table ix_core_structure_property (
       ix_core_structure_id varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_userprof (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        active boolean not null,
        hashp varchar(255),
        apikey varchar(255),
        ROLES_JSON varchar(2147483647),
        salt varchar(255),
        system_auth boolean not null,
        namespace_id bigint,
        user_id bigint,
        primary key (id)
    )

    create table ix_core_userprof_prop (
       ix_core_userprof_id bigint not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_value (
       DTYPE varchar(31) not null,
        id bigint not null,
        label varchar(255),
        heading varchar(1024),
        major_topic boolean,
        text varchar(2147483647),
        href varchar(2147483647),
        term varchar(255),
        data binary(255),
        mime_type varchar(32),
        sha1 varchar(40),
        data_size integer,
        intval bigint,
        numval double,
        unit varchar(255),
        average double,
        lval double,
        rval double,
        strval varchar(1024),
        primary key (id)
    )

    create table ix_core_xref (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        kind varchar(255) not null,
        refid varchar(40) not null,
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_xref_property (
       ix_core_xref_id bigint not null,
        ix_core_value_id bigint not null
    )

    create table ix_ginas_agentmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        agent_modification_process varchar(255),
        agent_modification_role varchar(255),
        agent_modification_type varchar(255),
        modification_group varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        agent_substance_uuid varchar(40),
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_amount (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        approval_id varchar(10),
        average double,
        high double,
        high_limit double,
        low double,
        low_limit double,
        non_numeric_value varchar(255),
        type varchar(255),
        units varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_code (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        code varchar(255) not null,
        code_system varchar(255),
        code_text varchar(2147483647),
        comments varchar(2147483647),
        type varchar(255),
        url varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_component (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        type varchar(255),
        role varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        substance_uuid varchar(40),
        amount_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_definition (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        definition varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_glycosylation (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        glycosylation_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        c_glycosylation_sites_uuid varchar(40),
        n_glycosylation_sites_uuid varchar(40),
        o_glycosylation_sites_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_linkage (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        linkage varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_material (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        defining boolean,
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        monomer_substance_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_mixture (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_modifications (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_moiety (
       inner_uuid varchar(255) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        uuid binary,
        created_by_id bigint,
        last_edited_by_id bigint,
        count_uuid varchar(40),
        owner_uuid varchar(40),
        structure_id varchar(40),
        primary key (inner_uuid)
    )

    create table ix_ginas_name (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        display_name boolean not null,
        domains clob,
        full_name varchar(2147483647),
        languages clob,
        name varchar(255) not null,
        name_jurisdiction clob,
        preferred boolean not null,
        std_name varchar(2147483647),
        type varchar(32),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nameorg (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        deprecated_date timestamp,
        name_org varchar(255) not null,
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_note (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        note varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        nucleic_acid_sub_type varchar(255),
        nucleic_acid_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        modifications_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid_subunits (
       ix_ginas_nucleicacid_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_otherlinks (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        linkage_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_parameter (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        name varchar(255) not null,
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        modification_group varchar(255),
        physical_modification_role varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalpar (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        parameter_name varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_polymer (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        classification_uuid varchar(40),
        display_structure_id varchar(40),
        idealized_structure_id varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_property (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        defining boolean,
        name varchar(255) not null,
        property_type varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        disulf_json varchar(2147483647),
        protein_sub_type varchar(255),
        protein_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        glycosylation_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein_subunit (
       ix_ginas_protein_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_reference (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        citation varchar(2147483647),
        doc_type varchar(255),
        document_date timestamp,
        id varchar(255),
        public_domain boolean not null,
        tags clob,
        uploaded_file varchar(1024),
        url varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_relationship (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        comments varchar(2147483647),
        interaction_type varchar(255),
        originator_uuid varchar(255),
        qualification varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        mediator_substance_uuid varchar(40),
        owner_uuid varchar(40),
        related_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_site_lob (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        site_count bigint not null,
        site_type varchar(255),
        sites_json varchar(2147483647),
        sites_short_hand varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_ssg1 (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_ssg3 (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        definition_uuid varchar(40),
        grade_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_ssg3_grade (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        name varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_strucdiv (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        developmental_stage varchar(255),
        fraction_material_type varchar(255),
        fraction_name varchar(255),
        infra_specific_name varchar(255),
        infra_specific_type varchar(255),
        organism_author varchar(255),
        organism_family varchar(255),
        organism_genus varchar(255),
        organism_species varchar(255),
        part clob,
        part_location varchar(255),
        source_material_class varchar(255),
        source_material_state varchar(255),
        source_material_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        maternal_uuid varchar(40),
        paternal_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_structuralmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        extent varchar(255),
        location_type varchar(255),
        modification_group varchar(255),
        moleculare_fragment_role varchar(255),
        residue_modified varchar(255),
        structural_modification_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        extent_amount_uuid varchar(40),
        molecular_fragment_uuid varchar(40),
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        approval_id varchar(20),
        approved timestamp,
        change_reason varchar(255),
        definition_level integer,
        definition_type integer,
        status varchar(255),
        class integer,
        version varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        approved_by_id bigint,
        modifications_uuid varchar(40),
        structure_id varchar(40),
        mixture_uuid varchar(40),
        nucleic_acid_uuid varchar(40),
        polymer_uuid varchar(40),
        protein_uuid varchar(40),
        specified_substance_uuid varchar(40),
        specified_substance_g3_uuid varchar(40),
        structurally_diverse_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance_mix_comp (
       ix_ginas_mixture_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_ss_comp (
       ix_ginas_ssg1_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_tags (
       ix_ginas_substance_uuid varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_ginas_substanceref (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        approval_ID varchar(32),
        ref_pname varchar(1024),
        refuuid varchar(128),
        substance_class varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_subunit (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        sequence varchar(2147483647),
        subunit_index integer,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_sugar (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        sugar varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_unit (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        attachmentMap varchar(2147483647),
        attachment_count integer,
        label varchar(255),
        structure varchar(2147483647),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amap_id bigint,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table polymer_classification (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        polymer_class varchar(255),
        polymer_geometry varchar(255),
        polymer_subclass clob,
        source_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    alter table ix_core_backup 
       add constraint UK_6n0ebodjb5t7yoxowli7t5qud unique (refid)

    alter table ix_core_etag 
       add constraint UK_hvark3ftc0xax8dcbjuftcn7v unique (etag)

    alter table ix_core_group 
       add constraint UK_pm62da77mybok0t03dd0a9oum unique (name)

    alter table ix_core_namespace 
       add constraint UK_t3wv0p58vflh5n2vnj6rjan75 unique (name)

    alter table ix_core_principal 
       add constraint UK_p8p720bdp9bkws54yip7x1t47 unique (username)

    alter table ix_ginas_moiety 
       add constraint UK_8cr4axbsithvjxcfhnltaejsp unique (uuid)

    alter table ix_core_acl_group 
       add constraint fkffablaywfq4inuntnok9otle 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table ix_core_acl_group 
       add constraint fk8a5l9ehfusnoigq1r4robs2da 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table ix_core_acl_principal 
       add constraint fkpf5d4mu9td8et6k5pgt78jma8 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table ix_core_acl_principal 
       add constraint fkc9bo2bwjfcf7djff6coigl2b1 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table ix_core_backup 
       add constraint fknulpohkjr0e7imml16hnmcl2c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_edit 
       add constraint fkj2b3ncg8uek4q4tjua17gvkgi 
       foreign key (editor_id) 
       references ix_core_principal

    alter table ix_core_etag 
       add constraint fk22kqxphqlg1d1hmsi2wtm6k0c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_figure 
       add constraint fk911xrg14bag2m8e096i9d75lu 
       foreign key (parent_id) 
       references ix_core_figure

    alter table ix_core_group_principal 
       add constraint fkp21u3ryjg094idoi9alrg90p7 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table ix_core_group_principal 
       add constraint fk1voeekm54sy5sc3et2fqo0unx 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table ix_core_namespace 
       add constraint fkdgo5yjubgilh1nauv1t69gslx 
       foreign key (owner_id) 
       references ix_core_principal

    alter table ix_core_payload 
       add constraint fkd150c5llpyncrqgpmqvvj8c9g 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_payload_property 
       add constraint fki6ubcj55u3pq0gm70ay7umle1 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_payload_property 
       add constraint fk6j2diflggrmws0k3suo8ms215 
       foreign key (ix_core_payload_id) 
       references ix_core_payload

    alter table ix_core_principal 
       add constraint fk6th1516rd9u5crfw7r12qtypk 
       foreign key (selfie_id) 
       references ix_core_figure

    alter table ix_core_structure 
       add constraint fksobht0ese9794r3q9k1q6i7gp 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_core_structure 
       add constraint fk37rfonx9x7vmkwsru7dxxqhhk 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_core_structure_link 
       add constraint fkdca3xgv2a5p344i74yc7sk89v 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table ix_core_structure_link 
       add constraint fk44si68uocnubt6vaobd4mgmmy 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table ix_core_structure_property 
       add constraint fk4n49941jj4uufoosy5n1g9rg6 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_structure_property 
       add constraint fkok4h9jsov59dh00wnrmsnd12x 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table ix_core_userprof 
       add constraint fks5bqupbwldu7843qnt8tuntnu 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_userprof 
       add constraint fknq0obnfqd9j3uh1uxdqn3ouq7 
       foreign key (user_id) 
       references ix_core_principal

    alter table ix_core_userprof_prop 
       add constraint fknfow9qqryxbxgppprcum5khf8 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_userprof_prop 
       add constraint fklloqe5wbjywhajh4tw6ilfnvg 
       foreign key (ix_core_userprof_id) 
       references ix_core_userprof

    alter table ix_core_xref 
       add constraint fk6g9t8ugidjwe166t5nk7x2wqm 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_xref_property 
       add constraint fkaucrto6dcvyyq1n6jo332gqsf 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_xref_property 
       add constraint fkmr6or6lteb684kq2e1dgsxl1w 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table ix_ginas_agentmod 
       add constraint fk837ol47m9wstcu74fp5toniam 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_agentmod 
       add constraint fk2prhrnc5vlo55jxu1rxgpfdw1 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_agentmod 
       add constraint fk2x5f4lw85tpkym1r3urwp2u3w 
       foreign key (agent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_agentmod 
       add constraint fki7hwi4cyu1hi7yjo2ddwkig51 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_agentmod 
       add constraint fk9ybw4linkblw3p4u25cq6qs0d 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_amount 
       add constraint fkqsmrbuknll0fmv6jthf4cycy5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_amount 
       add constraint fk9leptgx7incy9twmrwcpeo2bm 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fkfwn6blkrhusg1xhrue0u820p 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fkpio633txjf8p5soyujcrtbx9v 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fke9p0ygr5drc93bxry80f9y215 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_component 
       add constraint fkodvtp4qvwc7nyfr3lbc893o6m 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_component 
       add constraint fkbbvqudmdnm60le1imuwb2uj5x 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_component 
       add constraint fkql4nn094peyvxrwctj1ga2wp2 
       foreign key (substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_component 
       add constraint fksqa51pxp5tbk6vyu34qbr8c5u 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_definition 
       add constraint fk4kcslc98jcqx137enxl5fgs5t 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_definition 
       add constraint fk9wxg9p9i1bi7qoxfcu9gkg9og 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fk6dapjdumuglm11xxawpupefqm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fkpglm1avjx8n78aom78j3ju3bf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fkqiim2s89ddjuxbkhpv3xa023j 
       foreign key (c_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_glycosylation 
       add constraint fkffabrw84stgayaui9g1a4wk1g 
       foreign key (n_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_glycosylation 
       add constraint fkmt1ufykgpny0dlxj36h6tgxwr 
       foreign key (o_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_linkage 
       add constraint fkq619bp0y4e8y3c6efgyp2k8ux 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_linkage 
       add constraint fkfctm6wmaejthxy8y5gtbaqd80 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_linkage 
       add constraint fkotqo99g96i7epg4s384xushll 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_linkage 
       add constraint fkaao7lfx6xsyc4l1cpmsga4vre 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_material 
       add constraint fk6ts531mold2ibya0c038hebea 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_material 
       add constraint fkpab2df5aaru3riy5vxd86uve3 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_material 
       add constraint fkipvr7dsgmt37oig421t41o385 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_material 
       add constraint fkegxevel4526aib74sesmtu25e 
       foreign key (monomer_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_material 
       add constraint fkuvsb9isctq5ela0dqy2hhwti 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table ix_ginas_mixture 
       add constraint fk4tqay4hgaqpm3sq8rx9184jat 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_mixture 
       add constraint fkjfwb6hqmtuoadhdx7wpkhxaju 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_mixture 
       add constraint fko0yqo20vk9l8tqybgp75o23km 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_modifications 
       add constraint fknt72fojjxifrwa7bfwjw8cpm5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_modifications 
       add constraint fkpod9b4pm2tw1e4llfvayoivw4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fkkw3ljg8rkiv07pcn0o0n3o02a 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fk3a5dgbi1pmatnvuta5a4wy3aq 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fkf0mktcfnu1ly1x7ubmf41lh2n 
       foreign key (count_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_moiety 
       add constraint fk8olyp6rpiq8yxtuk3mxsnbels 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_moiety 
       add constraint fkc3r993grtkv5al4opvpv554ga 
       foreign key (structure_id) 
       references ix_core_structure

    alter table ix_ginas_name 
       add constraint fklhhdrsy7v2qr1amwmw0981mv2 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_name 
       add constraint fkgwls3gldgeqmgliev3kcvhjml 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_name 
       add constraint fkeqm42ow1b2o1c3uhu3d1k2efm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_nameorg 
       add constraint fkk77bj1lax07ocd00s3sfmn6ot 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_nameorg 
       add constraint fkm5w47bga21kw55x56q7jbbguj 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_nameorg 
       add constraint fkqtmeq2vb6siyu40vxnw4c8vq 
       foreign key (owner_uuid) 
       references ix_ginas_name

    alter table ix_ginas_note 
       add constraint fkge1aq2fv84ucy1ilwx97vpuwu 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_note 
       add constraint fkpg2o4yxwwlbbw1rro1c5df60 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_note 
       add constraint fkj3nrt8342rqojj5d4k24w5tgm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_nucleicacid 
       add constraint fkm9yv3dunytjgyjfiq6r503lyr 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_nucleicacid 
       add constraint fk6jk9rw9co4676wg98pvseggxc 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_nucleicacid 
       add constraint fkck0ay4di4y12vsqd9gqw4qh4b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_nucleicacid_subunits 
       add constraint fkjun57ycd07jv8oe3h8566r488 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table ix_ginas_nucleicacid_subunits 
       add constraint fkdby8ustw4fo38x6e98cg814td 
       foreign key (ix_ginas_nucleicacid_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_otherlinks 
       add constraint fk9sukhdr4s0yje92m8hp82hitx 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_otherlinks 
       add constraint fkigwh0j2irewbpsb1xgael3pim 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_otherlinks 
       add constraint fkdub4td7p5ki0u4dl83j4u9ysr 
       foreign key (owner_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_otherlinks 
       add constraint fk5nj85bcu54jc56se3hm4q3chm 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_parameter 
       add constraint fklbuqth4cgx61sh4rcci2mdl1o 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_parameter 
       add constraint fklj93g1oplslasut6r924dft2l 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_parameter 
       add constraint fk9ixg1ch1e0hueyta2dh4vlidg 
       foreign key (owner_uuid) 
       references ix_ginas_property

    alter table ix_ginas_parameter 
       add constraint fkdxnyu34iqqponnw4bnj9hk8rb 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_parameter 
       add constraint fkix1d880p7x7v51quhcre616af 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_physicalmod 
       add constraint fk32ojpkiiy03fk8ro0eyclrbkh 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalmod 
       add constraint fk23yuiouuyqodtlxmjxopv0ybf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalmod 
       add constraint fkd8fg9mm0ilkfdii08s5qsonde 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_physicalpar 
       add constraint fkrfgl3mys5n5wiknd32enb7hmb 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalpar 
       add constraint fkd1w1xyqt12divo39phpoi2113 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalpar 
       add constraint fk4ce1vbnehe206ru4gctnlkidh 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_physicalpar 
       add constraint fk1e30fjxi7rv1m875713tges77 
       foreign key (owner_uuid) 
       references ix_ginas_physicalmod

    alter table ix_ginas_polymer 
       add constraint fk8axkm0cbpwpc43krkhw8y6tad 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_polymer 
       add constraint fk5o81f597yvub0mf1b6cnqx8ev 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_polymer 
       add constraint fktn8tft3hwqnpv8tkfhtbh5jsm 
       foreign key (classification_uuid) 
       references polymer_classification

    alter table ix_ginas_polymer 
       add constraint fkcd56mdyyo9bvrrd80w0y8iixl 
       foreign key (display_structure_id) 
       references ix_core_structure

    alter table ix_ginas_polymer 
       add constraint fk264hsvr9c8q3w1e51j99ua2d0 
       foreign key (idealized_structure_id) 
       references ix_core_structure

    alter table ix_ginas_property 
       add constraint fktla10hxba7smca0g675soamsq 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_property 
       add constraint fkafltirwo87s1so6vigtf1s8mn 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_property 
       add constraint fkrlu3e72lq9y59122xd75q51vt 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_property 
       add constraint fkoh8nhvrowpdthcxj69pwkke9t 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_property 
       add constraint fkpbekqdofak8ol2fq92f5onn1t 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_protein 
       add constraint fk6ay15bqty5r2xmk13a4ld75rm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_protein 
       add constraint fkpovxe3t3ycsa1x6xivr20ukbh 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_protein 
       add constraint fkec7ms0paeosyymbpsnbu5pjfb 
       foreign key (glycosylation_uuid) 
       references ix_ginas_glycosylation

    alter table ix_ginas_protein_subunit 
       add constraint fklk7qxuwt9o7g8k6rphr5jj7ey 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table ix_ginas_protein_subunit 
       add constraint fk39xyg6fxghld06apb91xc1xt6 
       foreign key (ix_ginas_protein_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_reference 
       add constraint fkpv1epn9el8d1fpqct4px1nio7 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_reference 
       add constraint fk975dqn3b674b23ga0igmmct25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_reference 
       add constraint fkk7kui3q4qm7pwdq679ibkyi5h 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_relationship 
       add constraint fk70gmjxu8uevujxd4uetj6nfm3 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_relationship 
       add constraint fkmsd9lm6ayae7qbwp1iv50ftbb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_relationship 
       add constraint fk492eul84p3uecmkpqmd8ujvkb 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_relationship 
       add constraint fksim8mqlrevhpl0aa0hrdh3wwe 
       foreign key (mediator_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_relationship 
       add constraint fkr1msd0rheudj2srgokqrftrek 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_relationship 
       add constraint fkb6yhrsc7dprxg0apyknpue5ij 
       foreign key (related_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_site_lob 
       add constraint fkfbc7le8ehsxj39t2yikmmy3py 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_site_lob 
       add constraint fkh2cg1v3f9ha8t0w4l8iprib2g 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg1 
       add constraint fk3tljtp4q2e94j2q27hgnnhse4 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg1 
       add constraint fkle7gsf4fuf75tsrvksgvkjc25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fkphwuwyutg3qw0m6sltk2k313k 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fk8wpbv2gmw0rr6a0pywbvac0i5 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fk330e5sasucjp4134wpwtu8lwb 
       foreign key (definition_uuid) 
       references ix_ginas_definition

    alter table ix_ginas_ssg3 
       add constraint fklbcuwggmsgljs9ft8rg5e04te 
       foreign key (grade_uuid) 
       references ix_ginas_ssg3_grade

    alter table ix_ginas_ssg3 
       add constraint fk769l9w19w81s2hyvsi4o65evx 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_ssg3_grade 
       add constraint fknxhvkenjdx6shmj1qfw7em6sc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3_grade 
       add constraint fknyx3tbg0b5biha79eybm68heb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fkqpk4af5q91r4nsm521kd57298 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fk4epq4o38ci57y71dxu7ootl41 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fkhh72pwq35aaqgv370uavhtnjh 
       foreign key (maternal_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_strucdiv 
       add constraint fk6lcu1945kbaxi6fmir3qt5ugk 
       foreign key (paternal_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_strucdiv 
       add constraint fk27p7qapsxr5d2efscf8k7521 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_structuralmod 
       add constraint fkndd0pxjud610e953hg730emw 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_structuralmod 
       add constraint fk1ysjs1dx6uo8flj8rkiscscx4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_structuralmod 
       add constraint fktkmtm9vpmaklmypp3jad1pspp 
       foreign key (extent_amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_structuralmod 
       add constraint fk6n3mtotuwqi717fr2evp3dfxi 
       foreign key (molecular_fragment_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_structuralmod 
       add constraint fkoi4vt2lg0x2v3s4urckwjb3s3 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_structuralmod 
       add constraint fkb94sjca6cclvcwtx2osvdeuu 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_substance 
       add constraint fka9b6lpf9y3l0t04rviskjs8o1 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fk9hlo5n1alfg4rgloypq8agc3e 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fkmb0vxvmui506xtkh18lw1ucym 
       foreign key (approved_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fk30b2jg1r8dr4ibvt3f4h7ui3b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_substance 
       add constraint fkau9cajhw1nffg9w1vh0am4ls4 
       foreign key (structure_id) 
       references ix_core_structure

    alter table ix_ginas_substance 
       add constraint fkekk08a5uheng9eocf61xo4m2l 
       foreign key (mixture_uuid) 
       references ix_ginas_mixture

    alter table ix_ginas_substance 
       add constraint fk8lglxcodtpv6nj0wbw61cpdk9 
       foreign key (nucleic_acid_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_substance 
       add constraint fkncdqbv3ilcg21bws3e3y0xwg4 
       foreign key (polymer_uuid) 
       references ix_ginas_polymer

    alter table ix_ginas_substance 
       add constraint fkcw3qqer4es16onh3qgcuf6jb8 
       foreign key (protein_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_substance 
       add constraint fkd29meikxu3elfx1w5dket3ia5 
       foreign key (specified_substance_uuid) 
       references ix_ginas_ssg1

    alter table ix_ginas_substance 
       add constraint fkvubtca9k1urb0aqv6awf7evk 
       foreign key (specified_substance_g3_uuid) 
       references ix_ginas_ssg3

    alter table ix_ginas_substance 
       add constraint fkhrs798kf99tmayeg8hjbo9vdl 
       foreign key (structurally_diverse_uuid) 
       references ix_ginas_strucdiv

    alter table ix_ginas_substance_mix_comp 
       add constraint fkjsfcmh12rru7tls24cbkbmb0t 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table ix_ginas_substance_mix_comp 
       add constraint fkpubptahgdm25hadwlf3pwlfap 
       foreign key (ix_ginas_mixture_uuid) 
       references ix_ginas_mixture

    alter table ix_ginas_substance_ss_comp 
       add constraint fkb8ofx08elpr455o7a72rrr9tm 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table ix_ginas_substance_ss_comp 
       add constraint fkaf57kow6qnxnp2ya35n21jiyo 
       foreign key (ix_ginas_ssg1_uuid) 
       references ix_ginas_ssg1

    alter table ix_ginas_substance_tags 
       add constraint fkjlsvy9nlwl3vf5mvhcvf0y80k 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_ginas_substance_tags 
       add constraint fk2hyjvdeqia2qiemoagh6yjq6b 
       foreign key (ix_ginas_substance_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_substanceref 
       add constraint fko2bjxrp2qi847appx7ecf65vc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_substanceref 
       add constraint fkm6qbi1moehd7wqh9w2ip412us 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_subunit 
       add constraint fk7kjfdjus3twoyg4vd2jp367n6 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_subunit 
       add constraint fk9pyegqu1n4ekd45fdmitw12t7 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fke6ndxx94bjimsgux4lygsh51f 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fk1p4pfd811kxxjqfxbiuu9sknv 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fkkx0aeyak8r0byugf719kqu7ms 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_sugar 
       add constraint fkpx5dhn0168ipbpu04xgmby97y 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_unit 
       add constraint fkl4qe419byvtxe3epgd4a50glc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_unit 
       add constraint fknbsd63mfulnly1dtk7f6vxcq4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_unit 
       add constraint fkq8b5gi5r7thxi8vyrli5lrtu2 
       foreign key (amap_id) 
       references ix_core_value

    alter table ix_ginas_unit 
       add constraint fk2x4h6n93ud35rtm5nxt7xrcmw 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_unit 
       add constraint fkf3rxpagehygabef32q3kn4am 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table polymer_classification 
       add constraint fk9tp2yhc5vdofsdnx5cit45hdy 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table polymer_classification 
       add constraint fk6bup6ku2dri7cl4rgno4fd6dd 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table polymer_classification 
       add constraint fkl3chbblh2guqlw9ikn9grc3vb 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref
create sequence ix_core_acl_seq start with 1 increment by 1
create sequence ix_core_backup_seq start with 1 increment by 1
create sequence ix_core_etag_seq start with 1 increment by 1
create sequence ix_core_group_seq start with 1 increment by 1
create sequence ix_core_namespace_seq start with 1 increment by 1
create sequence ix_core_principal_seq start with 1 increment by 1
create sequence ix_core_userprof_seq start with 1 increment by 1
create sequence ix_core_value_seq start with 1 increment by 1
create sequence ix_core_xref_seq start with 1 increment by 1

    create table ix_core_acl (
       id bigint not null,
        perm integer,
        primary key (id)
    )

    create table ix_core_acl_group (
       ix_core_acl_id bigint not null,
        ix_core_group_id bigint not null
    )

    create table ix_core_acl_principal (
       ix_core_acl_id bigint not null,
        ix_core_principal_id bigint not null
    )

    create table ix_core_backup (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        compressed boolean not null,
        data binary(255),
        kind varchar(255),
        refid varchar(255),
        sha1 varchar(255),
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_edit (
       id binary not null,
        batch varchar(64),
        comments varchar(2147483647),
        created bigint,
        kind varchar(255),
        new_value varchar(2147483647),
        old_value varchar(2147483647),
        path varchar(1024),
        refid varchar(255),
        version varchar(255),
        editor_id bigint,
        primary key (id)
    )

    create table ix_core_etag (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        count integer,
        etag varchar(16),
        filter varchar(4000),
        method varchar(10),
        path varchar(255),
        query varchar(2048),
        sha1 varchar(40),
        skip integer,
        status integer,
        top integer,
        total integer,
        uri varchar(4000),
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_figure (
       DTYPE varchar(31) not null,
        id bigint not null,
        caption varchar(255),
        data binary(255),
        mime_type varchar(255),
        sha1 varchar(140),
        data_size integer,
        url varchar(1024),
        parent_id bigint,
        primary key (id)
    )

    create table ix_core_filedata (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        data binary(255),
        mime_type varchar(255),
        sha1 varchar(140),
        data_size bigint,
        primary key (id)
    )

    create table ix_core_group (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table ix_core_group_principal (
       ix_core_group_id bigint not null,
        ix_core_principal_id bigint not null,
        primary key (ix_core_group_id, ix_core_principal_id)
    )

    create table ix_core_namespace (
       id bigint not null,
        location varchar(1024),
        modifier integer,
        name varchar(255),
        owner_id bigint,
        primary key (id)
    )

    create table ix_core_payload (
       id varchar(40) not null,
        created timestamp,
        mime_type varchar(128),
        name varchar(1024),
        sha1 varchar(40),
        capacity bigint,
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_payload_property (
       ix_core_payload_id varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_principal (
       id bigint not null,
        is_admin boolean,
        created timestamp,
        deprecated boolean not null,
        email varchar(255),
        modified timestamp,
        provider varchar(255),
        uri varchar(1024),
        username varchar(255),
        version bigint,
        selfie_id bigint,
        primary key (id)
    )

    create table ix_core_structure (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        atropi integer,
        charge integer,
        count integer,
        created timestamp,
        defined_stereo integer,
        deprecated boolean not null,
        digest varchar(128),
        ez_centers integer,
        formula varchar(255),
        last_edited timestamp,
        molfile varchar(2147483647),
        mwt double,
        optical integer,
        smiles varchar(2147483647),
        stereo_centers integer,
        stereo varchar(255),
        stereo_comments varchar(2147483647),
        version bigint,
        internal_references clob,
        record_access longvarbinary,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (id)
    )

    create table ix_core_structure_link (
       ix_core_structure_id varchar(40) not null,
        ix_core_xref_id bigint not null
    )

    create table ix_core_structure_property (
       ix_core_structure_id varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_userprof (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        active boolean not null,
        hashp varchar(255),
        apikey varchar(255),
        ROLES_JSON varchar(2147483647),
        salt varchar(255),
        system_auth boolean not null,
        namespace_id bigint,
        user_id bigint,
        primary key (id)
    )

    create table ix_core_userprof_prop (
       ix_core_userprof_id bigint not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_value (
       DTYPE varchar(31) not null,
        id bigint not null,
        label varchar(255),
        heading varchar(1024),
        major_topic boolean,
        text varchar(2147483647),
        href varchar(2147483647),
        term varchar(255),
        data binary(255),
        mime_type varchar(32),
        sha1 varchar(40),
        data_size integer,
        intval bigint,
        numval double,
        unit varchar(255),
        average double,
        lval double,
        rval double,
        strval varchar(1024),
        primary key (id)
    )

    create table ix_core_xref (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        kind varchar(255) not null,
        refid varchar(40) not null,
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_xref_property (
       ix_core_xref_id bigint not null,
        ix_core_value_id bigint not null
    )

    create table ix_ginas_agentmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        agent_modification_process varchar(255),
        agent_modification_role varchar(255),
        agent_modification_type varchar(255),
        modification_group varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        agent_substance_uuid varchar(40),
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_amount (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        approval_id varchar(10),
        average double,
        high double,
        high_limit double,
        low double,
        low_limit double,
        non_numeric_value varchar(255),
        type varchar(255),
        units varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_code (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        code varchar(255) not null,
        code_system varchar(255),
        code_text varchar(2147483647),
        comments varchar(2147483647),
        type varchar(255),
        url varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_component (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        type varchar(255),
        role varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        substance_uuid varchar(40),
        amount_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_definition (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        definition varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_glycosylation (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        glycosylation_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        c_glycosylation_sites_uuid varchar(40),
        n_glycosylation_sites_uuid varchar(40),
        o_glycosylation_sites_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_linkage (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        linkage varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_material (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        defining boolean,
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        monomer_substance_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_mixture (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_modifications (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_moiety (
       inner_uuid varchar(255) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        uuid binary,
        created_by_id bigint,
        last_edited_by_id bigint,
        count_uuid varchar(40),
        owner_uuid varchar(40),
        structure_id varchar(40),
        primary key (inner_uuid)
    )

    create table ix_ginas_name (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        display_name boolean not null,
        domains clob,
        full_name varchar(2147483647),
        languages clob,
        name varchar(255) not null,
        name_jurisdiction clob,
        preferred boolean not null,
        std_name varchar(2147483647),
        type varchar(32),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nameorg (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        deprecated_date timestamp,
        name_org varchar(255) not null,
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_note (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        note varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        nucleic_acid_sub_type varchar(255),
        nucleic_acid_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        modifications_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid_subunits (
       ix_ginas_nucleicacid_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_otherlinks (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        linkage_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_parameter (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        name varchar(255) not null,
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        modification_group varchar(255),
        physical_modification_role varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalpar (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        parameter_name varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_polymer (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        classification_uuid varchar(40),
        display_structure_id varchar(40),
        idealized_structure_id varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_property (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        defining boolean,
        name varchar(255) not null,
        property_type varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        disulf_json varchar(2147483647),
        protein_sub_type varchar(255),
        protein_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        glycosylation_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein_subunit (
       ix_ginas_protein_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_reference (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        citation varchar(2147483647),
        doc_type varchar(255),
        document_date timestamp,
        id varchar(255),
        public_domain boolean not null,
        tags clob,
        uploaded_file varchar(1024),
        url varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_relationship (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        comments varchar(2147483647),
        interaction_type varchar(255),
        originator_uuid varchar(255),
        qualification varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        mediator_substance_uuid varchar(40),
        owner_uuid varchar(40),
        related_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_site_lob (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        site_count bigint not null,
        site_type varchar(255),
        sites_json varchar(2147483647),
        sites_short_hand varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_ssg1 (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_ssg3 (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        definition_uuid varchar(40),
        grade_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_ssg3_grade (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        name varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_strucdiv (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        developmental_stage varchar(255),
        fraction_material_type varchar(255),
        fraction_name varchar(255),
        infra_specific_name varchar(255),
        infra_specific_type varchar(255),
        organism_author varchar(255),
        organism_family varchar(255),
        organism_genus varchar(255),
        organism_species varchar(255),
        part clob,
        part_location varchar(255),
        source_material_class varchar(255),
        source_material_state varchar(255),
        source_material_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        maternal_uuid varchar(40),
        paternal_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_structuralmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        extent varchar(255),
        location_type varchar(255),
        modification_group varchar(255),
        moleculare_fragment_role varchar(255),
        residue_modified varchar(255),
        structural_modification_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        extent_amount_uuid varchar(40),
        molecular_fragment_uuid varchar(40),
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        approval_id varchar(20),
        approved timestamp,
        change_reason varchar(255),
        definition_level integer,
        definition_type integer,
        status varchar(255),
        class integer,
        version varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        approved_by_id bigint,
        modifications_uuid varchar(40),
        structure_id varchar(40),
        mixture_uuid varchar(40),
        nucleic_acid_uuid varchar(40),
        polymer_uuid varchar(40),
        protein_uuid varchar(40),
        specified_substance_uuid varchar(40),
        specified_substance_g3_uuid varchar(40),
        structurally_diverse_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance_mix_comp (
       ix_ginas_mixture_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_ss_comp (
       ix_ginas_ssg1_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_tags (
       ix_ginas_substance_uuid varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_ginas_substanceref (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        approval_ID varchar(32),
        ref_pname varchar(1024),
        refuuid varchar(128),
        substance_class varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_subunit (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        sequence varchar(2147483647),
        subunit_index integer,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_sugar (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        sugar varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_unit (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        attachmentMap varchar(2147483647),
        attachment_count integer,
        label varchar(255),
        structure varchar(2147483647),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amap_id bigint,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table polymer_classification (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        polymer_class varchar(255),
        polymer_geometry varchar(255),
        polymer_subclass clob,
        source_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    alter table ix_core_backup 
       add constraint UK_6n0ebodjb5t7yoxowli7t5qud unique (refid)

    alter table ix_core_etag 
       add constraint UK_hvark3ftc0xax8dcbjuftcn7v unique (etag)

    alter table ix_core_group 
       add constraint UK_pm62da77mybok0t03dd0a9oum unique (name)

    alter table ix_core_namespace 
       add constraint UK_t3wv0p58vflh5n2vnj6rjan75 unique (name)

    alter table ix_core_principal 
       add constraint UK_p8p720bdp9bkws54yip7x1t47 unique (username)

    alter table ix_ginas_moiety 
       add constraint UK_8cr4axbsithvjxcfhnltaejsp unique (uuid)

    alter table ix_core_acl_group 
       add constraint fkffablaywfq4inuntnok9otle 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table ix_core_acl_group 
       add constraint fk8a5l9ehfusnoigq1r4robs2da 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table ix_core_acl_principal 
       add constraint fkpf5d4mu9td8et6k5pgt78jma8 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table ix_core_acl_principal 
       add constraint fkc9bo2bwjfcf7djff6coigl2b1 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table ix_core_backup 
       add constraint fknulpohkjr0e7imml16hnmcl2c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_edit 
       add constraint fkj2b3ncg8uek4q4tjua17gvkgi 
       foreign key (editor_id) 
       references ix_core_principal

    alter table ix_core_etag 
       add constraint fk22kqxphqlg1d1hmsi2wtm6k0c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_figure 
       add constraint fk911xrg14bag2m8e096i9d75lu 
       foreign key (parent_id) 
       references ix_core_figure

    alter table ix_core_group_principal 
       add constraint fkp21u3ryjg094idoi9alrg90p7 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table ix_core_group_principal 
       add constraint fk1voeekm54sy5sc3et2fqo0unx 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table ix_core_namespace 
       add constraint fkdgo5yjubgilh1nauv1t69gslx 
       foreign key (owner_id) 
       references ix_core_principal

    alter table ix_core_payload 
       add constraint fkd150c5llpyncrqgpmqvvj8c9g 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_payload_property 
       add constraint fki6ubcj55u3pq0gm70ay7umle1 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_payload_property 
       add constraint fk6j2diflggrmws0k3suo8ms215 
       foreign key (ix_core_payload_id) 
       references ix_core_payload

    alter table ix_core_principal 
       add constraint fk6th1516rd9u5crfw7r12qtypk 
       foreign key (selfie_id) 
       references ix_core_figure

    alter table ix_core_structure 
       add constraint fksobht0ese9794r3q9k1q6i7gp 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_core_structure 
       add constraint fk37rfonx9x7vmkwsru7dxxqhhk 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_core_structure_link 
       add constraint fkdca3xgv2a5p344i74yc7sk89v 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table ix_core_structure_link 
       add constraint fk44si68uocnubt6vaobd4mgmmy 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table ix_core_structure_property 
       add constraint fk4n49941jj4uufoosy5n1g9rg6 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_structure_property 
       add constraint fkok4h9jsov59dh00wnrmsnd12x 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table ix_core_userprof 
       add constraint fks5bqupbwldu7843qnt8tuntnu 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_userprof 
       add constraint fknq0obnfqd9j3uh1uxdqn3ouq7 
       foreign key (user_id) 
       references ix_core_principal

    alter table ix_core_userprof_prop 
       add constraint fknfow9qqryxbxgppprcum5khf8 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_userprof_prop 
       add constraint fklloqe5wbjywhajh4tw6ilfnvg 
       foreign key (ix_core_userprof_id) 
       references ix_core_userprof

    alter table ix_core_xref 
       add constraint fk6g9t8ugidjwe166t5nk7x2wqm 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_xref_property 
       add constraint fkaucrto6dcvyyq1n6jo332gqsf 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_xref_property 
       add constraint fkmr6or6lteb684kq2e1dgsxl1w 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table ix_ginas_agentmod 
       add constraint fk837ol47m9wstcu74fp5toniam 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_agentmod 
       add constraint fk2prhrnc5vlo55jxu1rxgpfdw1 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_agentmod 
       add constraint fk2x5f4lw85tpkym1r3urwp2u3w 
       foreign key (agent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_agentmod 
       add constraint fki7hwi4cyu1hi7yjo2ddwkig51 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_agentmod 
       add constraint fk9ybw4linkblw3p4u25cq6qs0d 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_amount 
       add constraint fkqsmrbuknll0fmv6jthf4cycy5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_amount 
       add constraint fk9leptgx7incy9twmrwcpeo2bm 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fkfwn6blkrhusg1xhrue0u820p 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fkpio633txjf8p5soyujcrtbx9v 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fke9p0ygr5drc93bxry80f9y215 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_component 
       add constraint fkodvtp4qvwc7nyfr3lbc893o6m 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_component 
       add constraint fkbbvqudmdnm60le1imuwb2uj5x 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_component 
       add constraint fkql4nn094peyvxrwctj1ga2wp2 
       foreign key (substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_component 
       add constraint fksqa51pxp5tbk6vyu34qbr8c5u 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_definition 
       add constraint fk4kcslc98jcqx137enxl5fgs5t 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_definition 
       add constraint fk9wxg9p9i1bi7qoxfcu9gkg9og 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fk6dapjdumuglm11xxawpupefqm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fkpglm1avjx8n78aom78j3ju3bf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fkqiim2s89ddjuxbkhpv3xa023j 
       foreign key (c_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_glycosylation 
       add constraint fkffabrw84stgayaui9g1a4wk1g 
       foreign key (n_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_glycosylation 
       add constraint fkmt1ufykgpny0dlxj36h6tgxwr 
       foreign key (o_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_linkage 
       add constraint fkq619bp0y4e8y3c6efgyp2k8ux 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_linkage 
       add constraint fkfctm6wmaejthxy8y5gtbaqd80 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_linkage 
       add constraint fkotqo99g96i7epg4s384xushll 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_linkage 
       add constraint fkaao7lfx6xsyc4l1cpmsga4vre 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_material 
       add constraint fk6ts531mold2ibya0c038hebea 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_material 
       add constraint fkpab2df5aaru3riy5vxd86uve3 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_material 
       add constraint fkipvr7dsgmt37oig421t41o385 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_material 
       add constraint fkegxevel4526aib74sesmtu25e 
       foreign key (monomer_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_material 
       add constraint fkuvsb9isctq5ela0dqy2hhwti 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table ix_ginas_mixture 
       add constraint fk4tqay4hgaqpm3sq8rx9184jat 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_mixture 
       add constraint fkjfwb6hqmtuoadhdx7wpkhxaju 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_mixture 
       add constraint fko0yqo20vk9l8tqybgp75o23km 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_modifications 
       add constraint fknt72fojjxifrwa7bfwjw8cpm5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_modifications 
       add constraint fkpod9b4pm2tw1e4llfvayoivw4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fkkw3ljg8rkiv07pcn0o0n3o02a 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fk3a5dgbi1pmatnvuta5a4wy3aq 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fkf0mktcfnu1ly1x7ubmf41lh2n 
       foreign key (count_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_moiety 
       add constraint fk8olyp6rpiq8yxtuk3mxsnbels 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_moiety 
       add constraint fkc3r993grtkv5al4opvpv554ga 
       foreign key (structure_id) 
       references ix_core_structure

    alter table ix_ginas_name 
       add constraint fklhhdrsy7v2qr1amwmw0981mv2 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_name 
       add constraint fkgwls3gldgeqmgliev3kcvhjml 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_name 
       add constraint fkeqm42ow1b2o1c3uhu3d1k2efm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_nameorg 
       add constraint fkk77bj1lax07ocd00s3sfmn6ot 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_nameorg 
       add constraint fkm5w47bga21kw55x56q7jbbguj 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_nameorg 
       add constraint fkqtmeq2vb6siyu40vxnw4c8vq 
       foreign key (owner_uuid) 
       references ix_ginas_name

    alter table ix_ginas_note 
       add constraint fkge1aq2fv84ucy1ilwx97vpuwu 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_note 
       add constraint fkpg2o4yxwwlbbw1rro1c5df60 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_note 
       add constraint fkj3nrt8342rqojj5d4k24w5tgm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_nucleicacid 
       add constraint fkm9yv3dunytjgyjfiq6r503lyr 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_nucleicacid 
       add constraint fk6jk9rw9co4676wg98pvseggxc 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_nucleicacid 
       add constraint fkck0ay4di4y12vsqd9gqw4qh4b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_nucleicacid_subunits 
       add constraint fkjun57ycd07jv8oe3h8566r488 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table ix_ginas_nucleicacid_subunits 
       add constraint fkdby8ustw4fo38x6e98cg814td 
       foreign key (ix_ginas_nucleicacid_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_otherlinks 
       add constraint fk9sukhdr4s0yje92m8hp82hitx 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_otherlinks 
       add constraint fkigwh0j2irewbpsb1xgael3pim 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_otherlinks 
       add constraint fkdub4td7p5ki0u4dl83j4u9ysr 
       foreign key (owner_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_otherlinks 
       add constraint fk5nj85bcu54jc56se3hm4q3chm 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_parameter 
       add constraint fklbuqth4cgx61sh4rcci2mdl1o 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_parameter 
       add constraint fklj93g1oplslasut6r924dft2l 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_parameter 
       add constraint fk9ixg1ch1e0hueyta2dh4vlidg 
       foreign key (owner_uuid) 
       references ix_ginas_property

    alter table ix_ginas_parameter 
       add constraint fkdxnyu34iqqponnw4bnj9hk8rb 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_parameter 
       add constraint fkix1d880p7x7v51quhcre616af 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_physicalmod 
       add constraint fk32ojpkiiy03fk8ro0eyclrbkh 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalmod 
       add constraint fk23yuiouuyqodtlxmjxopv0ybf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalmod 
       add constraint fkd8fg9mm0ilkfdii08s5qsonde 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_physicalpar 
       add constraint fkrfgl3mys5n5wiknd32enb7hmb 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalpar 
       add constraint fkd1w1xyqt12divo39phpoi2113 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalpar 
       add constraint fk4ce1vbnehe206ru4gctnlkidh 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_physicalpar 
       add constraint fk1e30fjxi7rv1m875713tges77 
       foreign key (owner_uuid) 
       references ix_ginas_physicalmod

    alter table ix_ginas_polymer 
       add constraint fk8axkm0cbpwpc43krkhw8y6tad 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_polymer 
       add constraint fk5o81f597yvub0mf1b6cnqx8ev 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_polymer 
       add constraint fktn8tft3hwqnpv8tkfhtbh5jsm 
       foreign key (classification_uuid) 
       references polymer_classification

    alter table ix_ginas_polymer 
       add constraint fkcd56mdyyo9bvrrd80w0y8iixl 
       foreign key (display_structure_id) 
       references ix_core_structure

    alter table ix_ginas_polymer 
       add constraint fk264hsvr9c8q3w1e51j99ua2d0 
       foreign key (idealized_structure_id) 
       references ix_core_structure

    alter table ix_ginas_property 
       add constraint fktla10hxba7smca0g675soamsq 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_property 
       add constraint fkafltirwo87s1so6vigtf1s8mn 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_property 
       add constraint fkrlu3e72lq9y59122xd75q51vt 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_property 
       add constraint fkoh8nhvrowpdthcxj69pwkke9t 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_property 
       add constraint fkpbekqdofak8ol2fq92f5onn1t 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_protein 
       add constraint fk6ay15bqty5r2xmk13a4ld75rm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_protein 
       add constraint fkpovxe3t3ycsa1x6xivr20ukbh 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_protein 
       add constraint fkec7ms0paeosyymbpsnbu5pjfb 
       foreign key (glycosylation_uuid) 
       references ix_ginas_glycosylation

    alter table ix_ginas_protein_subunit 
       add constraint fklk7qxuwt9o7g8k6rphr5jj7ey 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table ix_ginas_protein_subunit 
       add constraint fk39xyg6fxghld06apb91xc1xt6 
       foreign key (ix_ginas_protein_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_reference 
       add constraint fkpv1epn9el8d1fpqct4px1nio7 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_reference 
       add constraint fk975dqn3b674b23ga0igmmct25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_reference 
       add constraint fkk7kui3q4qm7pwdq679ibkyi5h 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_relationship 
       add constraint fk70gmjxu8uevujxd4uetj6nfm3 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_relationship 
       add constraint fkmsd9lm6ayae7qbwp1iv50ftbb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_relationship 
       add constraint fk492eul84p3uecmkpqmd8ujvkb 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_relationship 
       add constraint fksim8mqlrevhpl0aa0hrdh3wwe 
       foreign key (mediator_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_relationship 
       add constraint fkr1msd0rheudj2srgokqrftrek 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_relationship 
       add constraint fkb6yhrsc7dprxg0apyknpue5ij 
       foreign key (related_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_site_lob 
       add constraint fkfbc7le8ehsxj39t2yikmmy3py 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_site_lob 
       add constraint fkh2cg1v3f9ha8t0w4l8iprib2g 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg1 
       add constraint fk3tljtp4q2e94j2q27hgnnhse4 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg1 
       add constraint fkle7gsf4fuf75tsrvksgvkjc25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fkphwuwyutg3qw0m6sltk2k313k 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fk8wpbv2gmw0rr6a0pywbvac0i5 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fk330e5sasucjp4134wpwtu8lwb 
       foreign key (definition_uuid) 
       references ix_ginas_definition

    alter table ix_ginas_ssg3 
       add constraint fklbcuwggmsgljs9ft8rg5e04te 
       foreign key (grade_uuid) 
       references ix_ginas_ssg3_grade

    alter table ix_ginas_ssg3 
       add constraint fk769l9w19w81s2hyvsi4o65evx 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_ssg3_grade 
       add constraint fknxhvkenjdx6shmj1qfw7em6sc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3_grade 
       add constraint fknyx3tbg0b5biha79eybm68heb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fkqpk4af5q91r4nsm521kd57298 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fk4epq4o38ci57y71dxu7ootl41 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fkhh72pwq35aaqgv370uavhtnjh 
       foreign key (maternal_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_strucdiv 
       add constraint fk6lcu1945kbaxi6fmir3qt5ugk 
       foreign key (paternal_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_strucdiv 
       add constraint fk27p7qapsxr5d2efscf8k7521 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_structuralmod 
       add constraint fkndd0pxjud610e953hg730emw 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_structuralmod 
       add constraint fk1ysjs1dx6uo8flj8rkiscscx4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_structuralmod 
       add constraint fktkmtm9vpmaklmypp3jad1pspp 
       foreign key (extent_amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_structuralmod 
       add constraint fk6n3mtotuwqi717fr2evp3dfxi 
       foreign key (molecular_fragment_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_structuralmod 
       add constraint fkoi4vt2lg0x2v3s4urckwjb3s3 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_structuralmod 
       add constraint fkb94sjca6cclvcwtx2osvdeuu 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_substance 
       add constraint fka9b6lpf9y3l0t04rviskjs8o1 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fk9hlo5n1alfg4rgloypq8agc3e 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fkmb0vxvmui506xtkh18lw1ucym 
       foreign key (approved_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fk30b2jg1r8dr4ibvt3f4h7ui3b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_substance 
       add constraint fkau9cajhw1nffg9w1vh0am4ls4 
       foreign key (structure_id) 
       references ix_core_structure

    alter table ix_ginas_substance 
       add constraint fkekk08a5uheng9eocf61xo4m2l 
       foreign key (mixture_uuid) 
       references ix_ginas_mixture

    alter table ix_ginas_substance 
       add constraint fk8lglxcodtpv6nj0wbw61cpdk9 
       foreign key (nucleic_acid_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_substance 
       add constraint fkncdqbv3ilcg21bws3e3y0xwg4 
       foreign key (polymer_uuid) 
       references ix_ginas_polymer

    alter table ix_ginas_substance 
       add constraint fkcw3qqer4es16onh3qgcuf6jb8 
       foreign key (protein_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_substance 
       add constraint fkd29meikxu3elfx1w5dket3ia5 
       foreign key (specified_substance_uuid) 
       references ix_ginas_ssg1

    alter table ix_ginas_substance 
       add constraint fkvubtca9k1urb0aqv6awf7evk 
       foreign key (specified_substance_g3_uuid) 
       references ix_ginas_ssg3

    alter table ix_ginas_substance 
       add constraint fkhrs798kf99tmayeg8hjbo9vdl 
       foreign key (structurally_diverse_uuid) 
       references ix_ginas_strucdiv

    alter table ix_ginas_substance_mix_comp 
       add constraint fkjsfcmh12rru7tls24cbkbmb0t 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table ix_ginas_substance_mix_comp 
       add constraint fkpubptahgdm25hadwlf3pwlfap 
       foreign key (ix_ginas_mixture_uuid) 
       references ix_ginas_mixture

    alter table ix_ginas_substance_ss_comp 
       add constraint fkb8ofx08elpr455o7a72rrr9tm 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table ix_ginas_substance_ss_comp 
       add constraint fkaf57kow6qnxnp2ya35n21jiyo 
       foreign key (ix_ginas_ssg1_uuid) 
       references ix_ginas_ssg1

    alter table ix_ginas_substance_tags 
       add constraint fkjlsvy9nlwl3vf5mvhcvf0y80k 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_ginas_substance_tags 
       add constraint fk2hyjvdeqia2qiemoagh6yjq6b 
       foreign key (ix_ginas_substance_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_substanceref 
       add constraint fko2bjxrp2qi847appx7ecf65vc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_substanceref 
       add constraint fkm6qbi1moehd7wqh9w2ip412us 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_subunit 
       add constraint fk7kjfdjus3twoyg4vd2jp367n6 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_subunit 
       add constraint fk9pyegqu1n4ekd45fdmitw12t7 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fke6ndxx94bjimsgux4lygsh51f 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fk1p4pfd811kxxjqfxbiuu9sknv 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fkkx0aeyak8r0byugf719kqu7ms 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_sugar 
       add constraint fkpx5dhn0168ipbpu04xgmby97y 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_unit 
       add constraint fkl4qe419byvtxe3epgd4a50glc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_unit 
       add constraint fknbsd63mfulnly1dtk7f6vxcq4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_unit 
       add constraint fkq8b5gi5r7thxi8vyrli5lrtu2 
       foreign key (amap_id) 
       references ix_core_value

    alter table ix_ginas_unit 
       add constraint fk2x4h6n93ud35rtm5nxt7xrcmw 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_unit 
       add constraint fkf3rxpagehygabef32q3kn4am 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table polymer_classification 
       add constraint fk9tp2yhc5vdofsdnx5cit45hdy 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table polymer_classification 
       add constraint fk6bup6ku2dri7cl4rgno4fd6dd 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table polymer_classification 
       add constraint fkl3chbblh2guqlw9ikn9grc3vb 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref
create sequence ix_core_acl_seq start with 1 increment by 1
create sequence ix_core_backup_seq start with 1 increment by 1
create sequence ix_core_etag_seq start with 1 increment by 1
create sequence ix_core_group_seq start with 1 increment by 1
create sequence ix_core_namespace_seq start with 1 increment by 1
create sequence ix_core_principal_seq start with 1 increment by 1
create sequence ix_core_userprof_seq start with 1 increment by 1
create sequence ix_core_value_seq start with 1 increment by 1
create sequence ix_core_xref_seq start with 1 increment by 1

    create table ix_core_acl (
       id bigint not null,
        perm integer,
        primary key (id)
    )

    create table ix_core_acl_group (
       ix_core_acl_id bigint not null,
        ix_core_group_id bigint not null
    )

    create table ix_core_acl_principal (
       ix_core_acl_id bigint not null,
        ix_core_principal_id bigint not null
    )

    create table ix_core_backup (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        compressed boolean not null,
        data blob,
        kind varchar(255),
        refid varchar(255),
        sha1 varchar(255),
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_edit (
       id binary not null,
        batch varchar(64),
        comments clob,
        created bigint,
        kind varchar(255),
        new_value clob,
        old_value clob,
        path varchar(1024),
        refid varchar(255),
        version varchar(255),
        editor_id bigint,
        primary key (id)
    )

    create table ix_core_etag (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        count integer,
        etag varchar(16),
        filter varchar(4000),
        method varchar(10),
        path varchar(255),
        query varchar(2048),
        sha1 varchar(40),
        skip integer,
        status integer,
        top integer,
        total integer,
        uri varchar(4000),
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_figure (
       DTYPE varchar(31) not null,
        id bigint not null,
        caption varchar(255),
        data blob,
        mime_type varchar(255),
        sha1 varchar(140),
        data_size integer,
        url varchar(1024),
        parent_id bigint,
        primary key (id)
    )

    create table ix_core_filedata (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        data blob,
        mime_type varchar(255),
        sha1 varchar(140),
        data_size bigint,
        primary key (id)
    )

    create table ix_core_group (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table ix_core_group_principal (
       ix_core_group_id bigint not null,
        ix_core_principal_id bigint not null,
        primary key (ix_core_group_id, ix_core_principal_id)
    )

    create table ix_core_namespace (
       id bigint not null,
        location varchar(1024),
        modifier integer,
        name varchar(255),
        owner_id bigint,
        primary key (id)
    )

    create table ix_core_payload (
       id varchar(40) not null,
        created timestamp,
        mime_type varchar(128),
        name varchar(1024),
        sha1 varchar(40),
        capacity bigint,
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_payload_property (
       ix_core_payload_id varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_principal (
       id bigint not null,
        is_admin boolean,
        created timestamp,
        deprecated boolean not null,
        email varchar(255),
        modified timestamp,
        provider varchar(255),
        uri varchar(1024),
        username varchar(255),
        version bigint,
        selfie_id bigint,
        primary key (id)
    )

    create table ix_core_structure (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        atropi integer,
        charge integer,
        count integer,
        created timestamp,
        defined_stereo integer,
        deprecated boolean not null,
        digest varchar(128),
        ez_centers integer,
        formula varchar(255),
        last_edited timestamp,
        molfile varchar(2147483647),
        mwt double,
        optical integer,
        smiles varchar(2147483647),
        stereo_centers integer,
        stereo varchar(255),
        stereo_comments varchar(2147483647),
        version bigint,
        internal_references clob,
        record_access longvarbinary,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (id)
    )

    create table ix_core_structure_link (
       ix_core_structure_id varchar(40) not null,
        ix_core_xref_id bigint not null
    )

    create table ix_core_structure_property (
       ix_core_structure_id varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_userprof (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        active boolean not null,
        hashp varchar(255),
        apikey varchar(255),
        ROLES_JSON clob,
        salt varchar(255),
        system_auth boolean not null,
        namespace_id bigint,
        user_id bigint,
        primary key (id)
    )

    create table ix_core_userprof_prop (
       ix_core_userprof_id bigint not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_value (
       DTYPE varchar(31) not null,
        id bigint not null,
        label varchar(255),
        heading varchar(1024),
        major_topic boolean,
        text varchar(2147483647),
        href clob,
        term varchar(255),
        data blob,
        mime_type varchar(32),
        sha1 varchar(40),
        data_size integer,
        intval bigint,
        numval double,
        unit varchar(255),
        average double,
        lval double,
        rval double,
        strval varchar(1024),
        primary key (id)
    )

    create table ix_core_xref (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        kind varchar(255) not null,
        refid varchar(40) not null,
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_xref_property (
       ix_core_xref_id bigint not null,
        ix_core_value_id bigint not null
    )

    create table ix_ginas_agentmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        agent_modification_process varchar(255),
        agent_modification_role varchar(255),
        agent_modification_type varchar(255),
        modification_group varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        agent_substance_uuid varchar(40),
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_amount (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        approval_id varchar(10),
        average double,
        high double,
        high_limit double,
        low double,
        low_limit double,
        non_numeric_value varchar(255),
        type varchar(255),
        units varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_code (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        code varchar(255) not null,
        code_system varchar(255),
        code_text varchar(2147483647),
        comments varchar(2147483647),
        type varchar(255),
        url varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_component (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        type varchar(255),
        role varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        substance_uuid varchar(40),
        amount_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_definition (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        definition varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_glycosylation (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        glycosylation_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        c_glycosylation_sites_uuid varchar(40),
        n_glycosylation_sites_uuid varchar(40),
        o_glycosylation_sites_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_linkage (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        linkage varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_material (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        defining boolean,
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        monomer_substance_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_mixture (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_modifications (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_moiety (
       inner_uuid varchar(255) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        uuid binary,
        created_by_id bigint,
        last_edited_by_id bigint,
        count_uuid varchar(40),
        owner_uuid varchar(40),
        structure_id varchar(40),
        primary key (inner_uuid)
    )

    create table ix_ginas_name (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        display_name boolean not null,
        domains clob,
        full_name varchar(2147483647),
        languages clob,
        name varchar(255) not null,
        name_jurisdiction clob,
        preferred boolean not null,
        std_name varchar(2147483647),
        type varchar(32),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nameorg (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        deprecated_date timestamp,
        name_org varchar(255) not null,
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_note (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        note varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        nucleic_acid_sub_type varchar(255),
        nucleic_acid_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        modifications_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid_subunits (
       ix_ginas_nucleicacid_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_otherlinks (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        linkage_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_parameter (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        name varchar(255) not null,
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        modification_group varchar(255),
        physical_modification_role varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalpar (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        parameter_name varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_polymer (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        classification_uuid varchar(40),
        display_structure_id varchar(40),
        idealized_structure_id varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_property (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        defining boolean,
        name varchar(255) not null,
        property_type varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        disulf_json varchar(2147483647),
        protein_sub_type varchar(255),
        protein_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        glycosylation_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein_subunit (
       ix_ginas_protein_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_reference (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        citation varchar(2147483647),
        doc_type varchar(255),
        document_date timestamp,
        id varchar(255),
        public_domain boolean not null,
        tags clob,
        uploaded_file varchar(1024),
        url varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_relationship (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        comments varchar(2147483647),
        interaction_type varchar(255),
        originator_uuid varchar(255),
        qualification varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        mediator_substance_uuid varchar(40),
        owner_uuid varchar(40),
        related_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_site_lob (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        site_count bigint not null,
        site_type varchar(255),
        sites_json varchar(2147483647),
        sites_short_hand varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_ssg1 (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_ssg3 (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        definition_uuid varchar(40),
        grade_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_ssg3_grade (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        name varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_strucdiv (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        developmental_stage varchar(255),
        fraction_material_type varchar(255),
        fraction_name varchar(255),
        infra_specific_name varchar(255),
        infra_specific_type varchar(255),
        organism_author varchar(255),
        organism_family varchar(255),
        organism_genus varchar(255),
        organism_species varchar(255),
        part clob,
        part_location varchar(255),
        source_material_class varchar(255),
        source_material_state varchar(255),
        source_material_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        maternal_uuid varchar(40),
        paternal_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_structuralmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        extent varchar(255),
        location_type varchar(255),
        modification_group varchar(255),
        moleculare_fragment_role varchar(255),
        residue_modified varchar(255),
        structural_modification_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        extent_amount_uuid varchar(40),
        molecular_fragment_uuid varchar(40),
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        approval_id varchar(20),
        approved timestamp,
        change_reason varchar(255),
        definition_level integer,
        definition_type integer,
        status varchar(255),
        class integer,
        version varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        approved_by_id bigint,
        modifications_uuid varchar(40),
        structure_id varchar(40),
        mixture_uuid varchar(40),
        nucleic_acid_uuid varchar(40),
        polymer_uuid varchar(40),
        protein_uuid varchar(40),
        specified_substance_uuid varchar(40),
        specified_substance_g3_uuid varchar(40),
        structurally_diverse_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance_mix_comp (
       ix_ginas_mixture_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_ss_comp (
       ix_ginas_ssg1_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_tags (
       ix_ginas_substance_uuid varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_ginas_substanceref (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        approval_ID varchar(32),
        ref_pname varchar(1024),
        refuuid varchar(128),
        substance_class varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_subunit (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        sequence varchar(2147483647),
        subunit_index integer,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_sugar (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        sugar varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_unit (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        attachmentMap varchar(2147483647),
        attachment_count integer,
        label varchar(255),
        structure varchar(2147483647),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amap_id bigint,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table polymer_classification (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        polymer_class varchar(255),
        polymer_geometry varchar(255),
        polymer_subclass clob,
        source_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    alter table ix_core_backup 
       add constraint UK_6n0ebodjb5t7yoxowli7t5qud unique (refid)

    alter table ix_core_etag 
       add constraint UK_hvark3ftc0xax8dcbjuftcn7v unique (etag)

    alter table ix_core_group 
       add constraint UK_pm62da77mybok0t03dd0a9oum unique (name)

    alter table ix_core_namespace 
       add constraint UK_t3wv0p58vflh5n2vnj6rjan75 unique (name)

    alter table ix_core_principal 
       add constraint UK_p8p720bdp9bkws54yip7x1t47 unique (username)

    alter table ix_ginas_moiety 
       add constraint UK_8cr4axbsithvjxcfhnltaejsp unique (uuid)

    alter table ix_core_acl_group 
       add constraint fkffablaywfq4inuntnok9otle 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table ix_core_acl_group 
       add constraint fk8a5l9ehfusnoigq1r4robs2da 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table ix_core_acl_principal 
       add constraint fkpf5d4mu9td8et6k5pgt78jma8 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table ix_core_acl_principal 
       add constraint fkc9bo2bwjfcf7djff6coigl2b1 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table ix_core_backup 
       add constraint fknulpohkjr0e7imml16hnmcl2c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_edit 
       add constraint fkj2b3ncg8uek4q4tjua17gvkgi 
       foreign key (editor_id) 
       references ix_core_principal

    alter table ix_core_etag 
       add constraint fk22kqxphqlg1d1hmsi2wtm6k0c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_figure 
       add constraint fk911xrg14bag2m8e096i9d75lu 
       foreign key (parent_id) 
       references ix_core_figure

    alter table ix_core_group_principal 
       add constraint fkp21u3ryjg094idoi9alrg90p7 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table ix_core_group_principal 
       add constraint fk1voeekm54sy5sc3et2fqo0unx 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table ix_core_namespace 
       add constraint fkdgo5yjubgilh1nauv1t69gslx 
       foreign key (owner_id) 
       references ix_core_principal

    alter table ix_core_payload 
       add constraint fkd150c5llpyncrqgpmqvvj8c9g 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_payload_property 
       add constraint fki6ubcj55u3pq0gm70ay7umle1 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_payload_property 
       add constraint fk6j2diflggrmws0k3suo8ms215 
       foreign key (ix_core_payload_id) 
       references ix_core_payload

    alter table ix_core_principal 
       add constraint fk6th1516rd9u5crfw7r12qtypk 
       foreign key (selfie_id) 
       references ix_core_figure

    alter table ix_core_structure 
       add constraint fksobht0ese9794r3q9k1q6i7gp 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_core_structure 
       add constraint fk37rfonx9x7vmkwsru7dxxqhhk 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_core_structure_link 
       add constraint fkdca3xgv2a5p344i74yc7sk89v 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table ix_core_structure_link 
       add constraint fk44si68uocnubt6vaobd4mgmmy 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table ix_core_structure_property 
       add constraint fk4n49941jj4uufoosy5n1g9rg6 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_structure_property 
       add constraint fkok4h9jsov59dh00wnrmsnd12x 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table ix_core_userprof 
       add constraint fks5bqupbwldu7843qnt8tuntnu 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_userprof 
       add constraint fknq0obnfqd9j3uh1uxdqn3ouq7 
       foreign key (user_id) 
       references ix_core_principal

    alter table ix_core_userprof_prop 
       add constraint fknfow9qqryxbxgppprcum5khf8 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_userprof_prop 
       add constraint fklloqe5wbjywhajh4tw6ilfnvg 
       foreign key (ix_core_userprof_id) 
       references ix_core_userprof

    alter table ix_core_xref 
       add constraint fk6g9t8ugidjwe166t5nk7x2wqm 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_xref_property 
       add constraint fkaucrto6dcvyyq1n6jo332gqsf 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_xref_property 
       add constraint fkmr6or6lteb684kq2e1dgsxl1w 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table ix_ginas_agentmod 
       add constraint fk837ol47m9wstcu74fp5toniam 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_agentmod 
       add constraint fk2prhrnc5vlo55jxu1rxgpfdw1 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_agentmod 
       add constraint fk2x5f4lw85tpkym1r3urwp2u3w 
       foreign key (agent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_agentmod 
       add constraint fki7hwi4cyu1hi7yjo2ddwkig51 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_agentmod 
       add constraint fk9ybw4linkblw3p4u25cq6qs0d 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_amount 
       add constraint fkqsmrbuknll0fmv6jthf4cycy5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_amount 
       add constraint fk9leptgx7incy9twmrwcpeo2bm 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fkfwn6blkrhusg1xhrue0u820p 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fkpio633txjf8p5soyujcrtbx9v 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fke9p0ygr5drc93bxry80f9y215 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_component 
       add constraint fkodvtp4qvwc7nyfr3lbc893o6m 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_component 
       add constraint fkbbvqudmdnm60le1imuwb2uj5x 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_component 
       add constraint fkql4nn094peyvxrwctj1ga2wp2 
       foreign key (substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_component 
       add constraint fksqa51pxp5tbk6vyu34qbr8c5u 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_definition 
       add constraint fk4kcslc98jcqx137enxl5fgs5t 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_definition 
       add constraint fk9wxg9p9i1bi7qoxfcu9gkg9og 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fk6dapjdumuglm11xxawpupefqm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fkpglm1avjx8n78aom78j3ju3bf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fkqiim2s89ddjuxbkhpv3xa023j 
       foreign key (c_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_glycosylation 
       add constraint fkffabrw84stgayaui9g1a4wk1g 
       foreign key (n_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_glycosylation 
       add constraint fkmt1ufykgpny0dlxj36h6tgxwr 
       foreign key (o_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_linkage 
       add constraint fkq619bp0y4e8y3c6efgyp2k8ux 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_linkage 
       add constraint fkfctm6wmaejthxy8y5gtbaqd80 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_linkage 
       add constraint fkotqo99g96i7epg4s384xushll 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_linkage 
       add constraint fkaao7lfx6xsyc4l1cpmsga4vre 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_material 
       add constraint fk6ts531mold2ibya0c038hebea 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_material 
       add constraint fkpab2df5aaru3riy5vxd86uve3 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_material 
       add constraint fkipvr7dsgmt37oig421t41o385 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_material 
       add constraint fkegxevel4526aib74sesmtu25e 
       foreign key (monomer_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_material 
       add constraint fkuvsb9isctq5ela0dqy2hhwti 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table ix_ginas_mixture 
       add constraint fk4tqay4hgaqpm3sq8rx9184jat 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_mixture 
       add constraint fkjfwb6hqmtuoadhdx7wpkhxaju 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_mixture 
       add constraint fko0yqo20vk9l8tqybgp75o23km 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_modifications 
       add constraint fknt72fojjxifrwa7bfwjw8cpm5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_modifications 
       add constraint fkpod9b4pm2tw1e4llfvayoivw4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fkkw3ljg8rkiv07pcn0o0n3o02a 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fk3a5dgbi1pmatnvuta5a4wy3aq 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fkf0mktcfnu1ly1x7ubmf41lh2n 
       foreign key (count_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_moiety 
       add constraint fk8olyp6rpiq8yxtuk3mxsnbels 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_moiety 
       add constraint fkc3r993grtkv5al4opvpv554ga 
       foreign key (structure_id) 
       references ix_core_structure

    alter table ix_ginas_name 
       add constraint fklhhdrsy7v2qr1amwmw0981mv2 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_name 
       add constraint fkgwls3gldgeqmgliev3kcvhjml 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_name 
       add constraint fkeqm42ow1b2o1c3uhu3d1k2efm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_nameorg 
       add constraint fkk77bj1lax07ocd00s3sfmn6ot 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_nameorg 
       add constraint fkm5w47bga21kw55x56q7jbbguj 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_nameorg 
       add constraint fkqtmeq2vb6siyu40vxnw4c8vq 
       foreign key (owner_uuid) 
       references ix_ginas_name

    alter table ix_ginas_note 
       add constraint fkge1aq2fv84ucy1ilwx97vpuwu 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_note 
       add constraint fkpg2o4yxwwlbbw1rro1c5df60 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_note 
       add constraint fkj3nrt8342rqojj5d4k24w5tgm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_nucleicacid 
       add constraint fkm9yv3dunytjgyjfiq6r503lyr 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_nucleicacid 
       add constraint fk6jk9rw9co4676wg98pvseggxc 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_nucleicacid 
       add constraint fkck0ay4di4y12vsqd9gqw4qh4b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_nucleicacid_subunits 
       add constraint fkjun57ycd07jv8oe3h8566r488 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table ix_ginas_nucleicacid_subunits 
       add constraint fkdby8ustw4fo38x6e98cg814td 
       foreign key (ix_ginas_nucleicacid_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_otherlinks 
       add constraint fk9sukhdr4s0yje92m8hp82hitx 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_otherlinks 
       add constraint fkigwh0j2irewbpsb1xgael3pim 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_otherlinks 
       add constraint fkdub4td7p5ki0u4dl83j4u9ysr 
       foreign key (owner_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_otherlinks 
       add constraint fk5nj85bcu54jc56se3hm4q3chm 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_parameter 
       add constraint fklbuqth4cgx61sh4rcci2mdl1o 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_parameter 
       add constraint fklj93g1oplslasut6r924dft2l 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_parameter 
       add constraint fk9ixg1ch1e0hueyta2dh4vlidg 
       foreign key (owner_uuid) 
       references ix_ginas_property

    alter table ix_ginas_parameter 
       add constraint fkdxnyu34iqqponnw4bnj9hk8rb 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_parameter 
       add constraint fkix1d880p7x7v51quhcre616af 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_physicalmod 
       add constraint fk32ojpkiiy03fk8ro0eyclrbkh 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalmod 
       add constraint fk23yuiouuyqodtlxmjxopv0ybf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalmod 
       add constraint fkd8fg9mm0ilkfdii08s5qsonde 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_physicalpar 
       add constraint fkrfgl3mys5n5wiknd32enb7hmb 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalpar 
       add constraint fkd1w1xyqt12divo39phpoi2113 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalpar 
       add constraint fk4ce1vbnehe206ru4gctnlkidh 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_physicalpar 
       add constraint fk1e30fjxi7rv1m875713tges77 
       foreign key (owner_uuid) 
       references ix_ginas_physicalmod

    alter table ix_ginas_polymer 
       add constraint fk8axkm0cbpwpc43krkhw8y6tad 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_polymer 
       add constraint fk5o81f597yvub0mf1b6cnqx8ev 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_polymer 
       add constraint fktn8tft3hwqnpv8tkfhtbh5jsm 
       foreign key (classification_uuid) 
       references polymer_classification

    alter table ix_ginas_polymer 
       add constraint fkcd56mdyyo9bvrrd80w0y8iixl 
       foreign key (display_structure_id) 
       references ix_core_structure

    alter table ix_ginas_polymer 
       add constraint fk264hsvr9c8q3w1e51j99ua2d0 
       foreign key (idealized_structure_id) 
       references ix_core_structure

    alter table ix_ginas_property 
       add constraint fktla10hxba7smca0g675soamsq 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_property 
       add constraint fkafltirwo87s1so6vigtf1s8mn 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_property 
       add constraint fkrlu3e72lq9y59122xd75q51vt 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_property 
       add constraint fkoh8nhvrowpdthcxj69pwkke9t 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_property 
       add constraint fkpbekqdofak8ol2fq92f5onn1t 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_protein 
       add constraint fk6ay15bqty5r2xmk13a4ld75rm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_protein 
       add constraint fkpovxe3t3ycsa1x6xivr20ukbh 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_protein 
       add constraint fkec7ms0paeosyymbpsnbu5pjfb 
       foreign key (glycosylation_uuid) 
       references ix_ginas_glycosylation

    alter table ix_ginas_protein_subunit 
       add constraint fklk7qxuwt9o7g8k6rphr5jj7ey 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table ix_ginas_protein_subunit 
       add constraint fk39xyg6fxghld06apb91xc1xt6 
       foreign key (ix_ginas_protein_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_reference 
       add constraint fkpv1epn9el8d1fpqct4px1nio7 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_reference 
       add constraint fk975dqn3b674b23ga0igmmct25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_reference 
       add constraint fkk7kui3q4qm7pwdq679ibkyi5h 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_relationship 
       add constraint fk70gmjxu8uevujxd4uetj6nfm3 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_relationship 
       add constraint fkmsd9lm6ayae7qbwp1iv50ftbb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_relationship 
       add constraint fk492eul84p3uecmkpqmd8ujvkb 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_relationship 
       add constraint fksim8mqlrevhpl0aa0hrdh3wwe 
       foreign key (mediator_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_relationship 
       add constraint fkr1msd0rheudj2srgokqrftrek 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_relationship 
       add constraint fkb6yhrsc7dprxg0apyknpue5ij 
       foreign key (related_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_site_lob 
       add constraint fkfbc7le8ehsxj39t2yikmmy3py 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_site_lob 
       add constraint fkh2cg1v3f9ha8t0w4l8iprib2g 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg1 
       add constraint fk3tljtp4q2e94j2q27hgnnhse4 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg1 
       add constraint fkle7gsf4fuf75tsrvksgvkjc25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fkphwuwyutg3qw0m6sltk2k313k 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fk8wpbv2gmw0rr6a0pywbvac0i5 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fk330e5sasucjp4134wpwtu8lwb 
       foreign key (definition_uuid) 
       references ix_ginas_definition

    alter table ix_ginas_ssg3 
       add constraint fklbcuwggmsgljs9ft8rg5e04te 
       foreign key (grade_uuid) 
       references ix_ginas_ssg3_grade

    alter table ix_ginas_ssg3 
       add constraint fk769l9w19w81s2hyvsi4o65evx 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_ssg3_grade 
       add constraint fknxhvkenjdx6shmj1qfw7em6sc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3_grade 
       add constraint fknyx3tbg0b5biha79eybm68heb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fkqpk4af5q91r4nsm521kd57298 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fk4epq4o38ci57y71dxu7ootl41 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fkhh72pwq35aaqgv370uavhtnjh 
       foreign key (maternal_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_strucdiv 
       add constraint fk6lcu1945kbaxi6fmir3qt5ugk 
       foreign key (paternal_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_strucdiv 
       add constraint fk27p7qapsxr5d2efscf8k7521 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_structuralmod 
       add constraint fkndd0pxjud610e953hg730emw 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_structuralmod 
       add constraint fk1ysjs1dx6uo8flj8rkiscscx4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_structuralmod 
       add constraint fktkmtm9vpmaklmypp3jad1pspp 
       foreign key (extent_amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_structuralmod 
       add constraint fk6n3mtotuwqi717fr2evp3dfxi 
       foreign key (molecular_fragment_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_structuralmod 
       add constraint fkoi4vt2lg0x2v3s4urckwjb3s3 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_structuralmod 
       add constraint fkb94sjca6cclvcwtx2osvdeuu 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_substance 
       add constraint fka9b6lpf9y3l0t04rviskjs8o1 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fk9hlo5n1alfg4rgloypq8agc3e 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fkmb0vxvmui506xtkh18lw1ucym 
       foreign key (approved_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fk30b2jg1r8dr4ibvt3f4h7ui3b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_substance 
       add constraint fkau9cajhw1nffg9w1vh0am4ls4 
       foreign key (structure_id) 
       references ix_core_structure

    alter table ix_ginas_substance 
       add constraint fkekk08a5uheng9eocf61xo4m2l 
       foreign key (mixture_uuid) 
       references ix_ginas_mixture

    alter table ix_ginas_substance 
       add constraint fk8lglxcodtpv6nj0wbw61cpdk9 
       foreign key (nucleic_acid_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_substance 
       add constraint fkncdqbv3ilcg21bws3e3y0xwg4 
       foreign key (polymer_uuid) 
       references ix_ginas_polymer

    alter table ix_ginas_substance 
       add constraint fkcw3qqer4es16onh3qgcuf6jb8 
       foreign key (protein_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_substance 
       add constraint fkd29meikxu3elfx1w5dket3ia5 
       foreign key (specified_substance_uuid) 
       references ix_ginas_ssg1

    alter table ix_ginas_substance 
       add constraint fkvubtca9k1urb0aqv6awf7evk 
       foreign key (specified_substance_g3_uuid) 
       references ix_ginas_ssg3

    alter table ix_ginas_substance 
       add constraint fkhrs798kf99tmayeg8hjbo9vdl 
       foreign key (structurally_diverse_uuid) 
       references ix_ginas_strucdiv

    alter table ix_ginas_substance_mix_comp 
       add constraint fkjsfcmh12rru7tls24cbkbmb0t 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table ix_ginas_substance_mix_comp 
       add constraint fkpubptahgdm25hadwlf3pwlfap 
       foreign key (ix_ginas_mixture_uuid) 
       references ix_ginas_mixture

    alter table ix_ginas_substance_ss_comp 
       add constraint fkb8ofx08elpr455o7a72rrr9tm 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table ix_ginas_substance_ss_comp 
       add constraint fkaf57kow6qnxnp2ya35n21jiyo 
       foreign key (ix_ginas_ssg1_uuid) 
       references ix_ginas_ssg1

    alter table ix_ginas_substance_tags 
       add constraint fkjlsvy9nlwl3vf5mvhcvf0y80k 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_ginas_substance_tags 
       add constraint fk2hyjvdeqia2qiemoagh6yjq6b 
       foreign key (ix_ginas_substance_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_substanceref 
       add constraint fko2bjxrp2qi847appx7ecf65vc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_substanceref 
       add constraint fkm6qbi1moehd7wqh9w2ip412us 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_subunit 
       add constraint fk7kjfdjus3twoyg4vd2jp367n6 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_subunit 
       add constraint fk9pyegqu1n4ekd45fdmitw12t7 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fke6ndxx94bjimsgux4lygsh51f 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fk1p4pfd811kxxjqfxbiuu9sknv 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fkkx0aeyak8r0byugf719kqu7ms 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_sugar 
       add constraint fkpx5dhn0168ipbpu04xgmby97y 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_unit 
       add constraint fkl4qe419byvtxe3epgd4a50glc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_unit 
       add constraint fknbsd63mfulnly1dtk7f6vxcq4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_unit 
       add constraint fkq8b5gi5r7thxi8vyrli5lrtu2 
       foreign key (amap_id) 
       references ix_core_value

    alter table ix_ginas_unit 
       add constraint fk2x4h6n93ud35rtm5nxt7xrcmw 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_unit 
       add constraint fkf3rxpagehygabef32q3kn4am 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table polymer_classification 
       add constraint fk9tp2yhc5vdofsdnx5cit45hdy 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table polymer_classification 
       add constraint fk6bup6ku2dri7cl4rgno4fd6dd 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table polymer_classification 
       add constraint fkl3chbblh2guqlw9ikn9grc3vb 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref
create sequence ix_core_acl_seq start with 1 increment by 1
create sequence ix_core_backup_seq start with 1 increment by 1
create sequence ix_core_etag_seq start with 1 increment by 1
create sequence ix_core_group_seq start with 1 increment by 1
create sequence ix_core_namespace_seq start with 1 increment by 1
create sequence ix_core_principal_seq start with 1 increment by 1
create sequence ix_core_userprof_seq start with 1 increment by 1
create sequence ix_core_value_seq start with 1 increment by 1
create sequence ix_core_xref_seq start with 1 increment by 1

    create table ix_core_acl (
       id bigint not null,
        perm integer,
        primary key (id)
    )

    create table ix_core_acl_group (
       ix_core_acl_id bigint not null,
        ix_core_group_id bigint not null
    )

    create table ix_core_acl_principal (
       ix_core_acl_id bigint not null,
        ix_core_principal_id bigint not null
    )

    create table ix_core_backup (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        compressed boolean not null,
        data blob,
        kind varchar(255),
        refid varchar(255),
        sha1 varchar(255),
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_edit (
       id binary not null,
        batch varchar(64),
        comments clob,
        created bigint,
        kind varchar(255),
        new_value clob,
        old_value clob,
        path varchar(1024),
        refid varchar(255),
        version varchar(255),
        editor_id bigint,
        primary key (id)
    )

    create table ix_core_etag (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        count integer,
        etag varchar(16),
        filter varchar(4000),
        method varchar(10),
        path varchar(255),
        query varchar(2048),
        sha1 varchar(40),
        skip integer,
        status integer,
        top integer,
        total integer,
        uri varchar(4000),
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_figure (
       DTYPE varchar(31) not null,
        id bigint not null,
        caption varchar(255),
        data blob,
        mime_type varchar(255),
        sha1 varchar(140),
        data_size integer,
        url varchar(1024),
        parent_id bigint,
        primary key (id)
    )

    create table ix_core_filedata (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        data blob,
        mime_type varchar(255),
        sha1 varchar(140),
        data_size bigint,
        primary key (id)
    )

    create table ix_core_group (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table ix_core_group_principal (
       ix_core_group_id bigint not null,
        ix_core_principal_id bigint not null,
        primary key (ix_core_group_id, ix_core_principal_id)
    )

    create table ix_core_namespace (
       id bigint not null,
        location varchar(1024),
        modifier integer,
        name varchar(255),
        owner_id bigint,
        primary key (id)
    )

    create table ix_core_payload (
       id varchar(40) not null,
        created timestamp,
        mime_type varchar(128),
        name varchar(1024),
        sha1 varchar(40),
        capacity bigint,
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_payload_property (
       ix_core_payload_id varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_principal (
       id bigint not null,
        is_admin boolean,
        created timestamp,
        deprecated boolean not null,
        email varchar(255),
        modified timestamp,
        provider varchar(255),
        uri varchar(1024),
        username varchar(255),
        version bigint,
        selfie_id bigint,
        primary key (id)
    )

    create table ix_core_structure (
       DTYPE varchar(31) not null,
        id varchar(40) not null,
        atropi integer,
        charge integer,
        count integer,
        created timestamp,
        defined_stereo integer,
        deprecated boolean not null,
        digest varchar(128),
        ez_centers integer,
        formula varchar(255),
        last_edited timestamp,
        molfile varchar(2147483647),
        mwt double,
        optical integer,
        smiles varchar(2147483647),
        stereo_centers integer,
        stereo varchar(255),
        stereo_comments varchar(2147483647),
        version bigint,
        internal_references clob,
        record_access longvarbinary,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (id)
    )

    create table ix_core_structure_link (
       ix_core_structure_id varchar(40) not null,
        ix_core_xref_id bigint not null
    )

    create table ix_core_structure_property (
       ix_core_structure_id varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_userprof (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        active boolean not null,
        hashp varchar(255),
        apikey varchar(255),
        ROLES_JSON clob,
        salt varchar(255),
        system_auth boolean not null,
        namespace_id bigint,
        user_id bigint,
        primary key (id)
    )

    create table ix_core_userprof_prop (
       ix_core_userprof_id bigint not null,
        ix_core_value_id bigint not null
    )

    create table ix_core_value (
       DTYPE varchar(31) not null,
        id bigint not null,
        label varchar(255),
        heading varchar(1024),
        major_topic boolean,
        text varchar(2147483647),
        href clob,
        term varchar(255),
        data blob,
        mime_type varchar(32),
        sha1 varchar(40),
        data_size integer,
        intval bigint,
        numval double,
        unit varchar(255),
        average double,
        lval double,
        rval double,
        strval varchar(1024),
        primary key (id)
    )

    create table ix_core_xref (
       id bigint not null,
        created timestamp,
        deprecated boolean not null,
        modified timestamp,
        version bigint,
        kind varchar(255) not null,
        refid varchar(40) not null,
        namespace_id bigint,
        primary key (id)
    )

    create table ix_core_xref_property (
       ix_core_xref_id bigint not null,
        ix_core_value_id bigint not null
    )

    create table ix_ginas_agentmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        agent_modification_process varchar(255),
        agent_modification_role varchar(255),
        agent_modification_type varchar(255),
        modification_group varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        agent_substance_uuid varchar(40),
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_amount (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        approval_id varchar(10),
        average double,
        high double,
        high_limit double,
        low double,
        low_limit double,
        non_numeric_value varchar(255),
        type varchar(255),
        units varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_code (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        code varchar(255) not null,
        code_system varchar(255),
        code_text varchar(2147483647),
        comments varchar(2147483647),
        type varchar(255),
        url varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_component (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        type varchar(255),
        role varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        substance_uuid varchar(40),
        amount_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_definition (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        definition varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_glycosylation (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        glycosylation_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        c_glycosylation_sites_uuid varchar(40),
        n_glycosylation_sites_uuid varchar(40),
        o_glycosylation_sites_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_linkage (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        linkage varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_material (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        defining boolean,
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        monomer_substance_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_mixture (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_modifications (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_moiety (
       inner_uuid varchar(255) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        uuid binary,
        created_by_id bigint,
        last_edited_by_id bigint,
        count_uuid varchar(40),
        owner_uuid varchar(40),
        structure_id varchar(40),
        primary key (inner_uuid)
    )

    create table ix_ginas_name (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        display_name boolean not null,
        domains clob,
        full_name varchar(2147483647),
        languages clob,
        name varchar(255) not null,
        name_jurisdiction clob,
        preferred boolean not null,
        std_name varchar(2147483647),
        type varchar(32),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nameorg (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        deprecated_date timestamp,
        name_org varchar(255) not null,
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_note (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        note varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        nucleic_acid_sub_type varchar(255),
        nucleic_acid_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        modifications_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_nucleicacid_subunits (
       ix_ginas_nucleicacid_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_otherlinks (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        linkage_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_parameter (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        name varchar(255) not null,
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        modification_group varchar(255),
        physical_modification_role varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_physicalpar (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        parameter_name varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_polymer (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        classification_uuid varchar(40),
        display_structure_id varchar(40),
        idealized_structure_id varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_property (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        defining boolean,
        name varchar(255) not null,
        property_type varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        referenced_substance_uuid varchar(40),
        value_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        disulf_json varchar(2147483647),
        protein_sub_type varchar(255),
        protein_type varchar(255),
        sequence_origin varchar(255),
        sequence_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        glycosylation_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_protein_subunit (
       ix_ginas_protein_uuid varchar(40) not null,
        ix_ginas_subunit_uuid varchar(40) not null
    )

    create table ix_ginas_reference (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        citation varchar(2147483647),
        doc_type varchar(255),
        document_date timestamp,
        id varchar(255),
        public_domain boolean not null,
        tags clob,
        uploaded_file varchar(1024),
        url varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_relationship (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        comments varchar(2147483647),
        interaction_type varchar(255),
        originator_uuid varchar(255),
        qualification varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amount_uuid varchar(40),
        mediator_substance_uuid varchar(40),
        owner_uuid varchar(40),
        related_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_site_lob (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        site_count bigint not null,
        site_type varchar(255),
        sites_json varchar(2147483647),
        sites_short_hand varchar(2147483647),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_ssg1 (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_ssg3 (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        created_by_id bigint,
        last_edited_by_id bigint,
        definition_uuid varchar(40),
        grade_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_ssg3_grade (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        name varchar(255),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_strucdiv (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        developmental_stage varchar(255),
        fraction_material_type varchar(255),
        fraction_name varchar(255),
        infra_specific_name varchar(255),
        infra_specific_type varchar(255),
        organism_author varchar(255),
        organism_family varchar(255),
        organism_genus varchar(255),
        organism_species varchar(255),
        part clob,
        part_location varchar(255),
        source_material_class varchar(255),
        source_material_state varchar(255),
        source_material_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        maternal_uuid varchar(40),
        paternal_uuid varchar(40),
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_structuralmod (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        extent varchar(255),
        location_type varchar(255),
        modification_group varchar(255),
        moleculare_fragment_role varchar(255),
        residue_modified varchar(255),
        structural_modification_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        extent_amount_uuid varchar(40),
        molecular_fragment_uuid varchar(40),
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance (
       DTYPE varchar(31) not null,
        uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        approval_id varchar(20),
        approved timestamp,
        change_reason varchar(255),
        definition_level integer,
        definition_type integer,
        status varchar(255),
        class integer,
        version varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        approved_by_id bigint,
        modifications_uuid varchar(40),
        structure_id varchar(40),
        mixture_uuid varchar(40),
        nucleic_acid_uuid varchar(40),
        polymer_uuid varchar(40),
        protein_uuid varchar(40),
        specified_substance_uuid varchar(40),
        specified_substance_g3_uuid varchar(40),
        structurally_diverse_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_substance_mix_comp (
       ix_ginas_mixture_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_ss_comp (
       ix_ginas_ssg1_uuid varchar(40) not null,
        ix_ginas_component_uuid varchar(40) not null
    )

    create table ix_ginas_substance_tags (
       ix_ginas_substance_uuid varchar(40) not null,
        ix_core_value_id bigint not null
    )

    create table ix_ginas_substanceref (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        approval_ID varchar(32),
        ref_pname varchar(1024),
        refuuid varchar(128),
        substance_class varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_subunit (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        sequence varchar(2147483647),
        subunit_index integer,
        created_by_id bigint,
        last_edited_by_id bigint,
        primary key (uuid)
    )

    create table ix_ginas_sugar (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        sugar varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        owner_uuid varchar(40),
        site_container_uuid varchar(40),
        primary key (uuid)
    )

    create table ix_ginas_unit (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        attachmentMap varchar(2147483647),
        attachment_count integer,
        label varchar(255),
        structure varchar(2147483647),
        type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        amap_id bigint,
        amount_uuid varchar(40),
        owner_uuid varchar(40),
        primary key (uuid)
    )

    create table polymer_classification (
       uuid varchar(40) not null,
        created timestamp,
        current_version integer not null,
        deprecated boolean not null,
        internal_version bigint,
        last_edited timestamp,
        record_access longvarbinary,
        internal_references clob,
        polymer_class varchar(255),
        polymer_geometry varchar(255),
        polymer_subclass clob,
        source_type varchar(255),
        created_by_id bigint,
        last_edited_by_id bigint,
        parent_substance_uuid varchar(40),
        primary key (uuid)
    )

    alter table ix_core_backup 
       add constraint UK_6n0ebodjb5t7yoxowli7t5qud unique (refid)

    alter table ix_core_etag 
       add constraint UK_hvark3ftc0xax8dcbjuftcn7v unique (etag)

    alter table ix_core_group 
       add constraint UK_pm62da77mybok0t03dd0a9oum unique (name)

    alter table ix_core_namespace 
       add constraint UK_t3wv0p58vflh5n2vnj6rjan75 unique (name)

    alter table ix_core_principal 
       add constraint UK_p8p720bdp9bkws54yip7x1t47 unique (username)

    alter table ix_ginas_moiety 
       add constraint UK_8cr4axbsithvjxcfhnltaejsp unique (uuid)

    alter table ix_core_acl_group 
       add constraint fkffablaywfq4inuntnok9otle 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table ix_core_acl_group 
       add constraint fk8a5l9ehfusnoigq1r4robs2da 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table ix_core_acl_principal 
       add constraint fkpf5d4mu9td8et6k5pgt78jma8 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table ix_core_acl_principal 
       add constraint fkc9bo2bwjfcf7djff6coigl2b1 
       foreign key (ix_core_acl_id) 
       references ix_core_acl

    alter table ix_core_backup 
       add constraint fknulpohkjr0e7imml16hnmcl2c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_edit 
       add constraint fkj2b3ncg8uek4q4tjua17gvkgi 
       foreign key (editor_id) 
       references ix_core_principal

    alter table ix_core_etag 
       add constraint fk22kqxphqlg1d1hmsi2wtm6k0c 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_figure 
       add constraint fk911xrg14bag2m8e096i9d75lu 
       foreign key (parent_id) 
       references ix_core_figure

    alter table ix_core_group_principal 
       add constraint fkp21u3ryjg094idoi9alrg90p7 
       foreign key (ix_core_principal_id) 
       references ix_core_principal

    alter table ix_core_group_principal 
       add constraint fk1voeekm54sy5sc3et2fqo0unx 
       foreign key (ix_core_group_id) 
       references ix_core_group

    alter table ix_core_namespace 
       add constraint fkdgo5yjubgilh1nauv1t69gslx 
       foreign key (owner_id) 
       references ix_core_principal

    alter table ix_core_payload 
       add constraint fkd150c5llpyncrqgpmqvvj8c9g 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_payload_property 
       add constraint fki6ubcj55u3pq0gm70ay7umle1 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_payload_property 
       add constraint fk6j2diflggrmws0k3suo8ms215 
       foreign key (ix_core_payload_id) 
       references ix_core_payload

    alter table ix_core_principal 
       add constraint fk6th1516rd9u5crfw7r12qtypk 
       foreign key (selfie_id) 
       references ix_core_figure

    alter table ix_core_structure 
       add constraint fksobht0ese9794r3q9k1q6i7gp 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_core_structure 
       add constraint fk37rfonx9x7vmkwsru7dxxqhhk 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_core_structure_link 
       add constraint fkdca3xgv2a5p344i74yc7sk89v 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table ix_core_structure_link 
       add constraint fk44si68uocnubt6vaobd4mgmmy 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table ix_core_structure_property 
       add constraint fk4n49941jj4uufoosy5n1g9rg6 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_structure_property 
       add constraint fkok4h9jsov59dh00wnrmsnd12x 
       foreign key (ix_core_structure_id) 
       references ix_core_structure

    alter table ix_core_userprof 
       add constraint fks5bqupbwldu7843qnt8tuntnu 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_userprof 
       add constraint fknq0obnfqd9j3uh1uxdqn3ouq7 
       foreign key (user_id) 
       references ix_core_principal

    alter table ix_core_userprof_prop 
       add constraint fknfow9qqryxbxgppprcum5khf8 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_userprof_prop 
       add constraint fklloqe5wbjywhajh4tw6ilfnvg 
       foreign key (ix_core_userprof_id) 
       references ix_core_userprof

    alter table ix_core_xref 
       add constraint fk6g9t8ugidjwe166t5nk7x2wqm 
       foreign key (namespace_id) 
       references ix_core_namespace

    alter table ix_core_xref_property 
       add constraint fkaucrto6dcvyyq1n6jo332gqsf 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_core_xref_property 
       add constraint fkmr6or6lteb684kq2e1dgsxl1w 
       foreign key (ix_core_xref_id) 
       references ix_core_xref

    alter table ix_ginas_agentmod 
       add constraint fk837ol47m9wstcu74fp5toniam 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_agentmod 
       add constraint fk2prhrnc5vlo55jxu1rxgpfdw1 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_agentmod 
       add constraint fk2x5f4lw85tpkym1r3urwp2u3w 
       foreign key (agent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_agentmod 
       add constraint fki7hwi4cyu1hi7yjo2ddwkig51 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_agentmod 
       add constraint fk9ybw4linkblw3p4u25cq6qs0d 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_amount 
       add constraint fkqsmrbuknll0fmv6jthf4cycy5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_amount 
       add constraint fk9leptgx7incy9twmrwcpeo2bm 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fkfwn6blkrhusg1xhrue0u820p 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fkpio633txjf8p5soyujcrtbx9v 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_code 
       add constraint fke9p0ygr5drc93bxry80f9y215 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_component 
       add constraint fkodvtp4qvwc7nyfr3lbc893o6m 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_component 
       add constraint fkbbvqudmdnm60le1imuwb2uj5x 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_component 
       add constraint fkql4nn094peyvxrwctj1ga2wp2 
       foreign key (substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_component 
       add constraint fksqa51pxp5tbk6vyu34qbr8c5u 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_definition 
       add constraint fk4kcslc98jcqx137enxl5fgs5t 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_definition 
       add constraint fk9wxg9p9i1bi7qoxfcu9gkg9og 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fk6dapjdumuglm11xxawpupefqm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fkpglm1avjx8n78aom78j3ju3bf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_glycosylation 
       add constraint fkqiim2s89ddjuxbkhpv3xa023j 
       foreign key (c_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_glycosylation 
       add constraint fkffabrw84stgayaui9g1a4wk1g 
       foreign key (n_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_glycosylation 
       add constraint fkmt1ufykgpny0dlxj36h6tgxwr 
       foreign key (o_glycosylation_sites_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_linkage 
       add constraint fkq619bp0y4e8y3c6efgyp2k8ux 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_linkage 
       add constraint fkfctm6wmaejthxy8y5gtbaqd80 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_linkage 
       add constraint fkotqo99g96i7epg4s384xushll 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_linkage 
       add constraint fkaao7lfx6xsyc4l1cpmsga4vre 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_material 
       add constraint fk6ts531mold2ibya0c038hebea 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_material 
       add constraint fkpab2df5aaru3riy5vxd86uve3 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_material 
       add constraint fkipvr7dsgmt37oig421t41o385 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_material 
       add constraint fkegxevel4526aib74sesmtu25e 
       foreign key (monomer_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_material 
       add constraint fkuvsb9isctq5ela0dqy2hhwti 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table ix_ginas_mixture 
       add constraint fk4tqay4hgaqpm3sq8rx9184jat 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_mixture 
       add constraint fkjfwb6hqmtuoadhdx7wpkhxaju 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_mixture 
       add constraint fko0yqo20vk9l8tqybgp75o23km 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_modifications 
       add constraint fknt72fojjxifrwa7bfwjw8cpm5 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_modifications 
       add constraint fkpod9b4pm2tw1e4llfvayoivw4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fkkw3ljg8rkiv07pcn0o0n3o02a 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fk3a5dgbi1pmatnvuta5a4wy3aq 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_moiety 
       add constraint fkf0mktcfnu1ly1x7ubmf41lh2n 
       foreign key (count_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_moiety 
       add constraint fk8olyp6rpiq8yxtuk3mxsnbels 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_moiety 
       add constraint fkc3r993grtkv5al4opvpv554ga 
       foreign key (structure_id) 
       references ix_core_structure

    alter table ix_ginas_name 
       add constraint fklhhdrsy7v2qr1amwmw0981mv2 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_name 
       add constraint fkgwls3gldgeqmgliev3kcvhjml 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_name 
       add constraint fkeqm42ow1b2o1c3uhu3d1k2efm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_nameorg 
       add constraint fkk77bj1lax07ocd00s3sfmn6ot 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_nameorg 
       add constraint fkm5w47bga21kw55x56q7jbbguj 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_nameorg 
       add constraint fkqtmeq2vb6siyu40vxnw4c8vq 
       foreign key (owner_uuid) 
       references ix_ginas_name

    alter table ix_ginas_note 
       add constraint fkge1aq2fv84ucy1ilwx97vpuwu 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_note 
       add constraint fkpg2o4yxwwlbbw1rro1c5df60 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_note 
       add constraint fkj3nrt8342rqojj5d4k24w5tgm 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_nucleicacid 
       add constraint fkm9yv3dunytjgyjfiq6r503lyr 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_nucleicacid 
       add constraint fk6jk9rw9co4676wg98pvseggxc 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_nucleicacid 
       add constraint fkck0ay4di4y12vsqd9gqw4qh4b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_nucleicacid_subunits 
       add constraint fkjun57ycd07jv8oe3h8566r488 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table ix_ginas_nucleicacid_subunits 
       add constraint fkdby8ustw4fo38x6e98cg814td 
       foreign key (ix_ginas_nucleicacid_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_otherlinks 
       add constraint fk9sukhdr4s0yje92m8hp82hitx 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_otherlinks 
       add constraint fkigwh0j2irewbpsb1xgael3pim 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_otherlinks 
       add constraint fkdub4td7p5ki0u4dl83j4u9ysr 
       foreign key (owner_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_otherlinks 
       add constraint fk5nj85bcu54jc56se3hm4q3chm 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_parameter 
       add constraint fklbuqth4cgx61sh4rcci2mdl1o 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_parameter 
       add constraint fklj93g1oplslasut6r924dft2l 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_parameter 
       add constraint fk9ixg1ch1e0hueyta2dh4vlidg 
       foreign key (owner_uuid) 
       references ix_ginas_property

    alter table ix_ginas_parameter 
       add constraint fkdxnyu34iqqponnw4bnj9hk8rb 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_parameter 
       add constraint fkix1d880p7x7v51quhcre616af 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_physicalmod 
       add constraint fk32ojpkiiy03fk8ro0eyclrbkh 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalmod 
       add constraint fk23yuiouuyqodtlxmjxopv0ybf 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalmod 
       add constraint fkd8fg9mm0ilkfdii08s5qsonde 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_physicalpar 
       add constraint fkrfgl3mys5n5wiknd32enb7hmb 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalpar 
       add constraint fkd1w1xyqt12divo39phpoi2113 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_physicalpar 
       add constraint fk4ce1vbnehe206ru4gctnlkidh 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_physicalpar 
       add constraint fk1e30fjxi7rv1m875713tges77 
       foreign key (owner_uuid) 
       references ix_ginas_physicalmod

    alter table ix_ginas_polymer 
       add constraint fk8axkm0cbpwpc43krkhw8y6tad 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_polymer 
       add constraint fk5o81f597yvub0mf1b6cnqx8ev 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_polymer 
       add constraint fktn8tft3hwqnpv8tkfhtbh5jsm 
       foreign key (classification_uuid) 
       references polymer_classification

    alter table ix_ginas_polymer 
       add constraint fkcd56mdyyo9bvrrd80w0y8iixl 
       foreign key (display_structure_id) 
       references ix_core_structure

    alter table ix_ginas_polymer 
       add constraint fk264hsvr9c8q3w1e51j99ua2d0 
       foreign key (idealized_structure_id) 
       references ix_core_structure

    alter table ix_ginas_property 
       add constraint fktla10hxba7smca0g675soamsq 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_property 
       add constraint fkafltirwo87s1so6vigtf1s8mn 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_property 
       add constraint fkrlu3e72lq9y59122xd75q51vt 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_property 
       add constraint fkoh8nhvrowpdthcxj69pwkke9t 
       foreign key (referenced_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_property 
       add constraint fkpbekqdofak8ol2fq92f5onn1t 
       foreign key (value_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_protein 
       add constraint fk6ay15bqty5r2xmk13a4ld75rm 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_protein 
       add constraint fkpovxe3t3ycsa1x6xivr20ukbh 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_protein 
       add constraint fkec7ms0paeosyymbpsnbu5pjfb 
       foreign key (glycosylation_uuid) 
       references ix_ginas_glycosylation

    alter table ix_ginas_protein_subunit 
       add constraint fklk7qxuwt9o7g8k6rphr5jj7ey 
       foreign key (ix_ginas_subunit_uuid) 
       references ix_ginas_subunit

    alter table ix_ginas_protein_subunit 
       add constraint fk39xyg6fxghld06apb91xc1xt6 
       foreign key (ix_ginas_protein_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_reference 
       add constraint fkpv1epn9el8d1fpqct4px1nio7 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_reference 
       add constraint fk975dqn3b674b23ga0igmmct25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_reference 
       add constraint fkk7kui3q4qm7pwdq679ibkyi5h 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_relationship 
       add constraint fk70gmjxu8uevujxd4uetj6nfm3 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_relationship 
       add constraint fkmsd9lm6ayae7qbwp1iv50ftbb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_relationship 
       add constraint fk492eul84p3uecmkpqmd8ujvkb 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_relationship 
       add constraint fksim8mqlrevhpl0aa0hrdh3wwe 
       foreign key (mediator_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_relationship 
       add constraint fkr1msd0rheudj2srgokqrftrek 
       foreign key (owner_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_relationship 
       add constraint fkb6yhrsc7dprxg0apyknpue5ij 
       foreign key (related_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_site_lob 
       add constraint fkfbc7le8ehsxj39t2yikmmy3py 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_site_lob 
       add constraint fkh2cg1v3f9ha8t0w4l8iprib2g 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg1 
       add constraint fk3tljtp4q2e94j2q27hgnnhse4 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg1 
       add constraint fkle7gsf4fuf75tsrvksgvkjc25 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fkphwuwyutg3qw0m6sltk2k313k 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fk8wpbv2gmw0rr6a0pywbvac0i5 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3 
       add constraint fk330e5sasucjp4134wpwtu8lwb 
       foreign key (definition_uuid) 
       references ix_ginas_definition

    alter table ix_ginas_ssg3 
       add constraint fklbcuwggmsgljs9ft8rg5e04te 
       foreign key (grade_uuid) 
       references ix_ginas_ssg3_grade

    alter table ix_ginas_ssg3 
       add constraint fk769l9w19w81s2hyvsi4o65evx 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_ssg3_grade 
       add constraint fknxhvkenjdx6shmj1qfw7em6sc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_ssg3_grade 
       add constraint fknyx3tbg0b5biha79eybm68heb 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fkqpk4af5q91r4nsm521kd57298 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fk4epq4o38ci57y71dxu7ootl41 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_strucdiv 
       add constraint fkhh72pwq35aaqgv370uavhtnjh 
       foreign key (maternal_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_strucdiv 
       add constraint fk6lcu1945kbaxi6fmir3qt5ugk 
       foreign key (paternal_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_strucdiv 
       add constraint fk27p7qapsxr5d2efscf8k7521 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_structuralmod 
       add constraint fkndd0pxjud610e953hg730emw 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_structuralmod 
       add constraint fk1ysjs1dx6uo8flj8rkiscscx4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_structuralmod 
       add constraint fktkmtm9vpmaklmypp3jad1pspp 
       foreign key (extent_amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_structuralmod 
       add constraint fk6n3mtotuwqi717fr2evp3dfxi 
       foreign key (molecular_fragment_uuid) 
       references ix_ginas_substanceref

    alter table ix_ginas_structuralmod 
       add constraint fkoi4vt2lg0x2v3s4urckwjb3s3 
       foreign key (owner_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_structuralmod 
       add constraint fkb94sjca6cclvcwtx2osvdeuu 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_substance 
       add constraint fka9b6lpf9y3l0t04rviskjs8o1 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fk9hlo5n1alfg4rgloypq8agc3e 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fkmb0vxvmui506xtkh18lw1ucym 
       foreign key (approved_by_id) 
       references ix_core_principal

    alter table ix_ginas_substance 
       add constraint fk30b2jg1r8dr4ibvt3f4h7ui3b 
       foreign key (modifications_uuid) 
       references ix_ginas_modifications

    alter table ix_ginas_substance 
       add constraint fkau9cajhw1nffg9w1vh0am4ls4 
       foreign key (structure_id) 
       references ix_core_structure

    alter table ix_ginas_substance 
       add constraint fkekk08a5uheng9eocf61xo4m2l 
       foreign key (mixture_uuid) 
       references ix_ginas_mixture

    alter table ix_ginas_substance 
       add constraint fk8lglxcodtpv6nj0wbw61cpdk9 
       foreign key (nucleic_acid_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_substance 
       add constraint fkncdqbv3ilcg21bws3e3y0xwg4 
       foreign key (polymer_uuid) 
       references ix_ginas_polymer

    alter table ix_ginas_substance 
       add constraint fkcw3qqer4es16onh3qgcuf6jb8 
       foreign key (protein_uuid) 
       references ix_ginas_protein

    alter table ix_ginas_substance 
       add constraint fkd29meikxu3elfx1w5dket3ia5 
       foreign key (specified_substance_uuid) 
       references ix_ginas_ssg1

    alter table ix_ginas_substance 
       add constraint fkvubtca9k1urb0aqv6awf7evk 
       foreign key (specified_substance_g3_uuid) 
       references ix_ginas_ssg3

    alter table ix_ginas_substance 
       add constraint fkhrs798kf99tmayeg8hjbo9vdl 
       foreign key (structurally_diverse_uuid) 
       references ix_ginas_strucdiv

    alter table ix_ginas_substance_mix_comp 
       add constraint fkjsfcmh12rru7tls24cbkbmb0t 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table ix_ginas_substance_mix_comp 
       add constraint fkpubptahgdm25hadwlf3pwlfap 
       foreign key (ix_ginas_mixture_uuid) 
       references ix_ginas_mixture

    alter table ix_ginas_substance_ss_comp 
       add constraint fkb8ofx08elpr455o7a72rrr9tm 
       foreign key (ix_ginas_component_uuid) 
       references ix_ginas_component

    alter table ix_ginas_substance_ss_comp 
       add constraint fkaf57kow6qnxnp2ya35n21jiyo 
       foreign key (ix_ginas_ssg1_uuid) 
       references ix_ginas_ssg1

    alter table ix_ginas_substance_tags 
       add constraint fkjlsvy9nlwl3vf5mvhcvf0y80k 
       foreign key (ix_core_value_id) 
       references ix_core_value

    alter table ix_ginas_substance_tags 
       add constraint fk2hyjvdeqia2qiemoagh6yjq6b 
       foreign key (ix_ginas_substance_uuid) 
       references ix_ginas_substance

    alter table ix_ginas_substanceref 
       add constraint fko2bjxrp2qi847appx7ecf65vc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_substanceref 
       add constraint fkm6qbi1moehd7wqh9w2ip412us 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_subunit 
       add constraint fk7kjfdjus3twoyg4vd2jp367n6 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_subunit 
       add constraint fk9pyegqu1n4ekd45fdmitw12t7 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fke6ndxx94bjimsgux4lygsh51f 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fk1p4pfd811kxxjqfxbiuu9sknv 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_sugar 
       add constraint fkkx0aeyak8r0byugf719kqu7ms 
       foreign key (owner_uuid) 
       references ix_ginas_nucleicacid

    alter table ix_ginas_sugar 
       add constraint fkpx5dhn0168ipbpu04xgmby97y 
       foreign key (site_container_uuid) 
       references ix_ginas_site_lob

    alter table ix_ginas_unit 
       add constraint fkl4qe419byvtxe3epgd4a50glc 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table ix_ginas_unit 
       add constraint fknbsd63mfulnly1dtk7f6vxcq4 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table ix_ginas_unit 
       add constraint fkq8b5gi5r7thxi8vyrli5lrtu2 
       foreign key (amap_id) 
       references ix_core_value

    alter table ix_ginas_unit 
       add constraint fk2x4h6n93ud35rtm5nxt7xrcmw 
       foreign key (amount_uuid) 
       references ix_ginas_amount

    alter table ix_ginas_unit 
       add constraint fkf3rxpagehygabef32q3kn4am 
       foreign key (owner_uuid) 
       references ix_ginas_polymer

    alter table polymer_classification 
       add constraint fk9tp2yhc5vdofsdnx5cit45hdy 
       foreign key (created_by_id) 
       references ix_core_principal

    alter table polymer_classification 
       add constraint fk6bup6ku2dri7cl4rgno4fd6dd 
       foreign key (last_edited_by_id) 
       references ix_core_principal

    alter table polymer_classification 
       add constraint fkl3chbblh2guqlw9ikn9grc3vb 
       foreign key (parent_substance_uuid) 
       references ix_ginas_substanceref
