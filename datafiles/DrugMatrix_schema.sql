CREATE SCHEMA IF NOT EXISTS "public";

CREATE  TABLE "public".all_gene_fc ( 
	gene_name            varchar(403)    ,
	gene                 integer    ,
	symbol               varchar(20)    
 );

CREATE INDEX gene_symbol_idx ON "public".all_gene_fc USING  btree ( gene_name, symbol );

CREATE  TABLE "public".all_transcript_report ( 
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	expresson            integer    ,
	gene                 integer  NOT NULL  ,
	gene_name            varchar(403)    ,
	differentness        numeric(10,3)    ,
	log_ratio            numeric(10,3)    ,
	adjusted_log_ratio   numeric(10,3)    ,
	stdev_of_log_ratio   numeric(10,3)    ,
	score                numeric(13,12)    ,
	intensity            integer    ,
	"time"               numeric(6,2)  NOT NULL  ,
	time_unit            char(1)    ,
	dose                 numeric(10,4)  NOT NULL  ,
	dose_unit            varchar(8)  NOT NULL  ,
	organism_description varchar(100)  NOT NULL  ,
	chip_name            varchar(10)  NOT NULL  ,
	"type"               varchar(11)  NOT NULL  ,
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)    ,
	"map"                integer  NOT NULL  ,
	tissue               integer  NOT NULL  ,
	mol_structure_2d     integer    
 );

CREATE INDEX all_transcript_report_idx01 ON "public".all_transcript_report USING  btree ( gene );

CREATE INDEX all_transcript_report_idx02 ON "public".all_transcript_report USING  btree ( log_ratio );

CREATE INDEX all_transcript_report_idx03 ON "public".all_transcript_report USING  btree ( score );

CREATE INDEX all_transcript_report_idx04 ON "public".all_transcript_report USING  btree ( experiment );

CREATE INDEX all_transcript_report_idx05 ON "public".all_transcript_report USING  btree ( expresson );

CREATE INDEX all_transcript_report_idx06 ON "public".all_transcript_report USING  btree ( compound );

CREATE INDEX all_transcript_report_idx07 ON "public".all_transcript_report USING  btree ( differentness );

CREATE INDEX all_transcript_report_idx08 ON "public".all_transcript_report USING  btree ( experiment, gene );

CREATE INDEX all_transcript_report_idx09 ON "public".all_transcript_report USING  btree ( experiment, differentness );

CREATE INDEX all_transcript_report_idx10 ON "public".all_transcript_report USING  btree ( gene, compound, log_ratio );

CREATE INDEX all_transcript_report_idx11 ON "public".all_transcript_report USING  btree ( gene, experiment, log_ratio );

CREATE INDEX all_transcript_report_idx12 ON "public".all_transcript_report USING  btree ( experiment, expresson );

CREATE INDEX all_transcript_report_idx13 ON "public".all_transcript_report USING  btree ( experiment, score, log_ratio );

CREATE  TABLE "public".animal_annotation_report ( 
	animal_id            varchar(15)    ,
	sample_id            integer    ,
	study                integer    ,
	experiment           integer    ,
	hybridization        integer    ,
	"valid"              char(1)    ,
	"type"               varchar(1)    
 );

CREATE INDEX animal_annotation_rep_idx1 ON "public".animal_annotation_report USING  btree ( "type" );

CREATE INDEX animal_annotation_rep_idx2 ON "public".animal_annotation_report USING  btree ( sample_id );

CREATE  TABLE "public".assay_report ( 
	assay                integer  NOT NULL  ,
	assay_name           varchar(100)  NOT NULL  ,
	"type"               varchar(10)  NOT NULL  ,
	species              varchar(60)    ,
	catalog_id           varchar(8)    ,
	compound_activities  integer  NOT NULL  ,
	catalog_encrypted    varchar(20)    ,
	CONSTRAINT assay_report_pk PRIMARY KEY ( assay )
 );

CREATE  TABLE "public".assay_target_report ( 
	assay                integer  NOT NULL  ,
	assay_name           varchar(100)  NOT NULL  ,
	gene                 integer    ,
	gene_name            varchar(300)    
 );

CREATE INDEX assay_target_report_idx ON "public".assay_target_report USING  btree ( assay );

CREATE  TABLE "public".blood_report ( 
	assay                integer  NOT NULL  ,
	assay_name           varchar(100)  NOT NULL  ,
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	"time"               numeric(6,2)  NOT NULL  ,
	time_unit            char(1)    ,
	dose                 numeric(10,4)  NOT NULL  ,
	dose_unit            varchar(8)  NOT NULL  ,
	organism_description varchar(100)  NOT NULL  ,
	chip_name            varchar(10)  NOT NULL  ,
	"type"               varchar(10)  NOT NULL  ,
	score                numeric(5,3)  NOT NULL  ,
	log_ratio            numeric(5,3)  NOT NULL  ,
	stdev_of_log_ratio   numeric(5,3)  NOT NULL  ,
	avg_value            varchar(51)    ,
	normal_range         varchar(95)    ,
	normal_low           numeric(10,3)  NOT NULL  ,
	normal_high          numeric(10,3)  NOT NULL  
 );

CREATE INDEX blood_report_idx1 ON "public".blood_report USING  btree ( assay );

CREATE INDEX blood_report_idx2 ON "public".blood_report USING  btree ( score );

CREATE INDEX blood_report_idx3 ON "public".blood_report USING  btree ( log_ratio );

CREATE  TABLE "public".cas_report ( 
	compound             integer  NOT NULL  ,
	cas_number           varchar(15)  NOT NULL  
 );

CREATE INDEX cas_report_idx ON "public".cas_report USING  btree ( compound );

CREATE  TABLE "public".compound_activity_report ( 
	compound             integer  NOT NULL  ,
	compound_label       varchar(15)  NOT NULL  ,
	compound_name        varchar(250)  NOT NULL  ,
	mol_structure_2d     integer    ,
	inh_activity         numeric(12,6)  NOT NULL  ,
	inh_unit             varchar(27)  NOT NULL  ,
	ic50_activity        numeric(12,6)    ,
	ic50_unit            varchar(27)    ,
	ki_activity          numeric(12,6)    ,
	ki_unit              varchar(27)    ,
	assay                integer  NOT NULL  ,
	assay_name           varchar(100)  NOT NULL  
 );

CREATE INDEX compound_activity_report_idx ON "public".compound_activity_report USING  btree ( compound );

CREATE INDEX compound_activity_report_idx2 ON "public".compound_activity_report USING  btree ( assay );

CREATE  TABLE "public".compound_curation_report ( 
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)  NOT NULL  ,
	category             varchar(50)  NOT NULL  ,
	term                 varchar(500)  NOT NULL  
 );

CREATE INDEX compound_curation_rep_idx1 ON "public".compound_curation_report USING  btree ( compound );

CREATE  TABLE "public".compound_identifier_report ( 
	compound             integer    ,
	compound_name        varchar(250)    ,
	compound_identifier  varchar(27)    
 );

CREATE INDEX compound_identifier_rep_idx1 ON "public".compound_identifier_report USING  btree ( compound );

CREATE  TABLE "public".compound_literature_report ( 
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)  NOT NULL  ,
	mol_structure_2d     integer    ,
	gene                 integer    ,
	gene_name            varchar(300)    ,
	"type"               varchar(25)  NOT NULL  ,
	activity             numeric(12,5)  NOT NULL  ,
	units                varchar(10)  NOT NULL  ,
	description          varchar(350)    ,
	pubmed               bigint    
 );

CREATE INDEX compound_literature_rep_idx ON "public".compound_literature_report USING  btree ( compound );

CREATE  TABLE "public".compound_property_report ( 
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)  NOT NULL  ,
	category             varchar(10)  NOT NULL  ,
	"value"              numeric(6,2)    ,
	units                varchar(13)    
 );

CREATE INDEX compound_property_rep_idx1 ON "public".compound_property_report USING  btree ( compound );

CREATE  TABLE "public".compound_report ( 
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)  NOT NULL  ,
	compound_identifier  integer  NOT NULL  ,
	mol_structure_2d     integer    ,
	mol_weight           integer    ,
	formula              varchar(2000)    ,
	icxnumber            varchar(15)  NOT NULL  ,
	development_status   varchar(40)    ,
	smiles               varchar(500)    ,
	CONSTRAINT compound_report_pk PRIMARY KEY ( compound ),
	CONSTRAINT compound_report_unq1 UNIQUE ( compound_name ) ,
	CONSTRAINT compound_report_unq2 UNIQUE ( icxnumber ) 
 );

CREATE  TABLE "public".compound_similarity_report ( 
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)    ,
	mol_structure_2d     integer    ,
	probability          numeric(8,6)    ,
	score                numeric(5,2)  NOT NULL  ,
	"method"             varchar(10)  NOT NULL  ,
	query_compound       integer  NOT NULL  ,
	query_compound_name  varchar(250)  NOT NULL  
 );

CREATE INDEX compound_similarity_rep_idx1 ON "public".compound_similarity_report USING  btree ( query_compound );

CREATE INDEX compound_similarity_rep_idx2 ON "public".compound_similarity_report USING  btree ( compound );

CREATE  TABLE "public".compound_smile_report ( 
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)  NOT NULL  ,
	smiles               varchar(500)    
 );

CREATE INDEX compound_smile_rep_idx1 ON "public".compound_smile_report USING  btree ( compound );

CREATE  TABLE "public".compound_structure_report ( 
	compound             integer  NOT NULL  ,
	"structure"          text    
 );

CREATE INDEX compound_structure_rep_idx1 ON "public".compound_structure_report USING  btree ( compound );

CREATE  TABLE "public".compound_synonym_report ( 
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)  NOT NULL  ,
	synonym_name         varchar(250)  NOT NULL  
 );

CREATE INDEX compound_synonym_report_idx ON "public".compound_synonym_report USING  btree ( compound );

CREATE  TABLE "public".compound_target_report ( 
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)  NOT NULL  ,
	gene                 integer  NOT NULL  ,
	gene_name            varchar(300)  NOT NULL  
 );

CREATE INDEX compound_target_rep_idx1 ON "public".compound_target_report USING  btree ( compound );

CREATE INDEX compound_target_rep_idx2 ON "public".compound_target_report USING  btree ( gene );

CREATE  TABLE "public".dept ( 
	deptno               varchar(2)  NOT NULL  ,
	dname                varchar(30)  NOT NULL  ,
	loc                  varchar(30)    ,
	CONSTRAINT pk_dept PRIMARY KEY ( deptno ),
	CONSTRAINT uniq_dname UNIQUE ( dname ) 
 );

CREATE  TABLE "public".domain_column ( 
	"domain"             varchar(15)  NOT NULL  ,
	"table_name"         varchar(45)  NOT NULL  ,
	query_column         varchar(32)  NOT NULL  ,
	primary_column       varchar(32)  NOT NULL  ,
	name_column          varchar(32)  NOT NULL  ,
	name_table           varchar(45)  NOT NULL  ,
	lookup_name          varchar(32)  NOT NULL  ,
	name_pk              varchar(32)  NOT NULL  ,
	source_instance      varchar(10)    ,
	query_instance       varchar(10)    
 );

CREATE INDEX domain_column_idx ON "public".domain_column USING  btree ( "table_name" );

CREATE  TABLE "public".dose_justification_report ( 
	study                integer  NOT NULL  ,
	justification        text  NOT NULL  
 );

CREATE  TABLE "public".emp ( 
	empno                varchar(4)  NOT NULL  ,
	ename                varchar(15)  NOT NULL  ,
	job                  varchar(15)  NOT NULL  ,
	mgr                  varchar(4)    ,
	hiredate             date  NOT NULL  ,
	sal                  double precision  NOT NULL  ,
	comm                 double precision    ,
	deptno               varchar(2)    ,
	CONSTRAINT pk_empno PRIMARY KEY ( empno )
 );

CREATE  TABLE "public".exp_pathway_score_report ( 
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	pathway              integer  NOT NULL  ,
	pathway_name         varchar(100)    ,
	score                numeric(5,3)  NOT NULL  ,
	CONSTRAINT exp_pathway_score_report_pk PRIMARY KEY ( experiment, pathway )
 );

CREATE INDEX exp_pathway_score_rep_idx ON "public".exp_pathway_score_report USING  btree ( experiment );

CREATE INDEX exp_pathway_score_rep_idx2 ON "public".exp_pathway_score_report USING  btree ( pathway );

CREATE  TABLE "public".experiment_condition_report ( 
	experiment           numeric(38)  NOT NULL  ,
	experiment_version   integer    ,
	experiment_date      char(8)  NOT NULL  ,
	ratio_created_date   timestamp    ,
	array_technology     varchar(11)  NOT NULL  ,
	experiment_name      varchar(132)    ,
	chip_name            varchar(10)  NOT NULL  ,
	organism             varchar(5)  NOT NULL  ,
	organism_description varchar(100)  NOT NULL  ,
	tissue               integer  NOT NULL  ,
	tissue_name          varchar(20)  NOT NULL  ,
	tissue_priority      integer  NOT NULL  ,
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)    ,
	icxnumber            varchar(15)  NOT NULL  ,
	dose                 numeric(10,4)  NOT NULL  ,
	dose_unit            varchar(8)  NOT NULL  ,
	dose_level           varchar(3)    ,
	study                integer  NOT NULL  ,
	study_name           varchar(265)    ,
	ctllabel             varchar(8)  NOT NULL  ,
	explabel             varchar(8)  NOT NULL  ,
	control_set          varchar(40)    ,
	solvent              varchar(95)    ,
	administration_route varchar(25)    ,
	administration_frequency varchar(13)    ,
	medium               varchar(20)    ,
	"time"               numeric(6,2)  NOT NULL  ,
	time_unit            char(1)    ,
	"type"               char(10)    ,
	"valid"              char(1)    ,
	min_rel_error        numeric(5,4)    ,
	percent_induced      numeric(5,2)    ,
	percent_repressed    numeric(5,2)    ,
	percent_perturbed    numeric(5,2)    ,
	mol_structure_2d     integer    ,
	adjusted_log_ratio   bytea    ,
	original_log_ratio   bytea    ,
	pvalue               bytea    ,
	CONSTRAINT experiment_condition_report_pk PRIMARY KEY ( experiment )
 );

CREATE INDEX experiment_condition_rep_idx1 ON "public".experiment_condition_report USING  btree ( "type" );

CREATE INDEX experiment_condition_rep_idx2 ON "public".experiment_condition_report USING  btree ( "type", experiment );

CREATE  TABLE "public".experiment_histopath_counts ( 
	experiment           integer  NOT NULL  ,
	histopathology       integer  NOT NULL  ,
	average_severity_total double precision    ,
	average_severity_affected double precision    ,
	count_of_total       double precision    ,
	count_of_incidence   double precision    
 );

CREATE  TABLE "public".experiment_mapping ( 
	ru1_experiment       integer  NOT NULL  ,
	ru1_experiment_name  varchar(132)    ,
	rg230_2_experiment   integer  NOT NULL  ,
	rg230_2_experiment_name varchar(132)    
 );

CREATE  TABLE "public".experiment_organ_relwt_report ( 
	experiment           integer  NOT NULL  ,
	organ                varchar(44)    ,
	relative_weight      double precision    
 );

CREATE INDEX experiment_organ_relwt_rep_idx ON "public".experiment_organ_relwt_report USING  btree ( experiment, organ );

CREATE  TABLE "public".experiment_pathway_score ( 
	experiment           integer  NOT NULL  ,
	pathway              integer  NOT NULL  ,
	score                numeric(5,3)  NOT NULL  
 );

CREATE  TABLE "public".experiment_sample_report ( 
	experiment           integer  NOT NULL  ,
	sample_id            integer    
 );

CREATE  TABLE "public".experiment_severity_counts ( 
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	histopathology       integer  NOT NULL  ,
	histopathology_name  varchar(100)  NOT NULL  ,
	tissue               varchar(20)  NOT NULL  ,
	severity             integer  NOT NULL  ,
	count_of_incidence_severity smallint    
 );

CREATE  TABLE "public".expresson_report ( 
	expresson            integer  NOT NULL  ,
	expresson_name       varchar(100)    ,
	species              integer  NOT NULL  ,
	dna_sequence         integer    ,
	gene                 integer  NOT NULL  ,
	gene_name            varchar(403)    ,
	probe_accession      varchar(20)    ,
	probe                integer  NOT NULL  ,
	probe_name           varchar(30)  NOT NULL  ,
	CONSTRAINT expresson_report_pk PRIMARY KEY ( probe )
 );

CREATE INDEX expresson_report_idx ON "public".expresson_report USING  btree ( expresson );

CREATE  TABLE "public".gene_activity_report ( 
	compound             integer  NOT NULL  ,
	compound_label       varchar(15)  NOT NULL  ,
	compound_name        varchar(250)  NOT NULL  ,
	mol_structure_2d     integer    ,
	gene                 integer    ,
	gene_name            varchar(300)    ,
	inh_activity         numeric(12,6)  NOT NULL  ,
	inh_unit             varchar(27)  NOT NULL  ,
	ic50_activity        numeric(12,6)    ,
	ic50_unit            varchar(27)    ,
	ki_activity          numeric(12,6)    ,
	ki_unit              varchar(27)    ,
	assay                integer  NOT NULL  ,
	assay_name           varchar(100)  NOT NULL  
 );

CREATE INDEX gene_activity_report_idx ON "public".gene_activity_report USING  btree ( compound );

CREATE INDEX gene_activity_report_idx2 ON "public".gene_activity_report USING  btree ( gene );

CREATE INDEX gene_activity_report_idx3 ON "public".gene_activity_report USING  btree ( assay );

CREATE  TABLE "public".gene_annotation_report ( 
	gene                 integer  NOT NULL  ,
	category             char(25)    ,
	"value"              varchar(280)  NOT NULL  
 );

CREATE  TABLE "public".gene_identifier_report ( 
	gene                 integer  NOT NULL  ,
	gene_name            varchar(300)  NOT NULL  ,
	identifier           varchar(1000)    ,
	"database"           varchar(50)    ,
	"type"               varchar(24)  NOT NULL  ,
	id_species           varchar(60)  NOT NULL  ,
	gene_species         varchar(60)  NOT NULL  
 );

CREATE INDEX "idx$$_2a3d0001" ON "public".gene_identifier_report USING  btree ( gene, gene_name, identifier, "database", "type", id_species, gene_species );

CREATE  TABLE "public".gene_pathway_report ( 
	gene                 integer  NOT NULL  ,
	gene_name            varchar(300)  NOT NULL  ,
	pathway              integer  NOT NULL  ,
	pathway_name         varchar(100)    
 );

CREATE INDEX gene_pathway_report_idx ON "public".gene_pathway_report USING  btree ( gene );

CREATE INDEX gene_pathway_report_idx2 ON "public".gene_pathway_report USING  btree ( pathway );

CREATE  TABLE "public".gene_report ( 
	gene                 integer  NOT NULL  ,
	gene_name            varchar(300)  NOT NULL  ,
	species              integer  NOT NULL  ,
	symbol               varchar(20)    ,
	description          varchar(1500)    ,
	CONSTRAINT gene_report_pk PRIMARY KEY ( gene )
 );

CREATE  TABLE "public".gene_tissue_report ( 
	gene                 integer  NOT NULL  ,
	tissue               integer  NOT NULL  ,
	tissue_name          varchar(25)  NOT NULL  ,
	tissue_priority      integer  NOT NULL  
 );

CREATE INDEX gene_tissue_report_idx ON "public".gene_tissue_report USING  btree ( gene );

CREATE  TABLE "public".go_report ( 
	gene                 integer  NOT NULL  ,
	gene_name            varchar(300)  NOT NULL  ,
	category             varchar(20)  NOT NULL  ,
	term                 varchar(200)  NOT NULL  ,
	goid                 varchar(100)  NOT NULL  
 );

CREATE INDEX go_report_idx ON "public".go_report USING  btree ( gene );

CREATE  TABLE "public".histopath_annotation_report ( 
	histopathology       integer  NOT NULL  ,
	histopathology_name  varchar(100)  NOT NULL  ,
	category             varchar(50)  NOT NULL  ,
	"value"              varchar(300)  NOT NULL  
 );

CREATE  TABLE "public".histopath_description_report ( 
	histopathology       integer    ,
	histopathology_name  varchar(100)    ,
	description          varchar(1500)  NOT NULL  
 );

CREATE  TABLE "public".histopath_severity_report ( 
	histopathology       integer  NOT NULL  ,
	histopathology_name  varchar(100)  NOT NULL  ,
	severity             integer  NOT NULL  ,
	severity_name        varchar(10)  NOT NULL  ,
	frequency            numeric(7,1)  NOT NULL  ,
	ridit_score          numeric(7,3)  NOT NULL  
 );

CREATE  TABLE "public".histopathology_exp_fc ( 
	experiment           integer    ,
	experiment_name      varchar(132)    ,
	histopathology       integer    ,
	histopathology_name  varchar(100)    ,
	tissue_name          varchar(20)    ,
	average_severity_total double precision    ,
	average_severity_affected double precision    ,
	count_of_total       double precision    ,
	count_of_incidence   double precision    ,
	pvalue               numeric(7,6)    ,
	mean_ridit_score     numeric(7,3)    ,
	percent_incidence    double precision    ,
	severity_0           double precision    ,
	severity_1           double precision    ,
	severity_2           double precision    ,
	severity_3           double precision    ,
	severity_4           double precision    ,
	tissue               integer    
 );

CREATE INDEX liver_tissue_exp2_idx ON "public".histopathology_exp_fc USING  btree ( experiment, tissue );

CREATE  TABLE "public".histopathology_exp_report ( 
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	histopathology       integer  NOT NULL  ,
	histopathology_name  varchar(100)  NOT NULL  ,
	tissue_name          varchar(20)  NOT NULL  ,
	average_severity_total double precision    ,
	average_severity_affected double precision    ,
	count_of_total       double precision    ,
	count_of_incidence   double precision    ,
	pvalue               numeric(7,6)    ,
	mean_ridit_score     numeric(7,3)    ,
	percent_incidence    double precision    ,
	severity_0           double precision    ,
	severity_1           double precision    ,
	severity_2           double precision    ,
	severity_3           double precision    ,
	severity_4           double precision    
 );

CREATE INDEX histopathology_exp_report_idx ON "public".histopathology_exp_report USING  btree ( experiment, histopathology );

CREATE  TABLE "public".histopathology_image_report ( 
	histopathology       integer  NOT NULL  ,
	severity             integer  NOT NULL  ,
	severity_name        varchar(10)  NOT NULL  ,
	image_name           varchar(30)  NOT NULL  
 );

CREATE  TABLE "public".histopathology_report ( 
	histopathology       integer  NOT NULL  ,
	histopathology_name  varchar(100)  NOT NULL  ,
	tissue_name          varchar(20)  NOT NULL  ,
	CONSTRAINT histopathology_report_pk PRIMARY KEY ( histopathology )
 );

CREATE  TABLE "public".histopathology_study_report ( 
	histopathology       integer  NOT NULL  ,
	histopathology_name  varchar(100)  NOT NULL  ,
	study                integer  NOT NULL  ,
	study_name           varchar(265)    ,
	min_pvalue           double precision    ,
	max_average_severity_total double precision    ,
	max_average_severity_affected double precision    
 );

CREATE  TABLE "public".hybridization_and_image_report ( 
	hybridization        integer  NOT NULL  ,
	"type"               varchar(3)    ,
	"valid"              char(1)    ,
	experiment           integer  NOT NULL  
 );

CREATE INDEX hybridization_and_image_idx ON "public".hybridization_and_image_report USING  btree ( hybridization );

CREATE INDEX hybridization_and_image_idx2 ON "public".hybridization_and_image_report USING  btree ( experiment );

CREATE  TABLE "public".hybridization_date_report ( 
	hybridization        integer  NOT NULL  ,
	hyb_date             timestamp    ,
	target_prep_date     timestamp  NOT NULL  ,
	rna_extraction_date  timestamp  NOT NULL  ,
	experiment_date      timestamp    ,
	CONSTRAINT hybridization_date_report_pk PRIMARY KEY ( hybridization )
 );

CREATE  TABLE "public".iconix_users ( 
	id                   integer  NOT NULL  ,
	companyname          varchar(30)  NOT NULL  ,
	name                 varchar(15)  NOT NULL  ,
	"password"           varchar(80)  NOT NULL  ,
	accesslevel          smallint  NOT NULL  ,
	email                varchar(35)    ,
	fullname             varchar(35)    
 );

CREATE INDEX iconix_users_idx ON "public".iconix_users USING  btree ( id );

CREATE  TABLE "public".induced_transcript_report ( 
	gene                 integer  NOT NULL  ,
	gene_name            varchar(403)    ,
	expresson            integer    ,
	differentness        numeric(10,3)    ,
	log_ratio            numeric(10,3)    ,
	adjusted_log_ratio   numeric(10,3)    ,
	stdev_of_log_ratio   numeric(10,3)    ,
	score                numeric(13,12)    ,
	intensity            integer    ,
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	"time"               numeric(6,2)  NOT NULL  ,
	time_unit            char(1)    ,
	dose                 numeric(10,4)  NOT NULL  ,
	dose_unit            varchar(8)  NOT NULL  ,
	organism_description varchar(100)  NOT NULL  ,
	chip_name            varchar(10)  NOT NULL  ,
	"type"               varchar(11)  NOT NULL  ,
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)    ,
	tissue               integer  NOT NULL  ,
	mol_structure_2d     integer    
 );

CREATE INDEX induced_transcript_rep_idx1 ON "public".induced_transcript_report USING  btree ( score );

CREATE INDEX induced_transcript_rep_idx2 ON "public".induced_transcript_report USING  btree ( log_ratio );

CREATE INDEX induced_transcript_rep_idx3 ON "public".induced_transcript_report USING  btree ( gene );

CREATE INDEX induced_transcript_rep_idx4 ON "public".induced_transcript_report USING  btree ( experiment );

CREATE INDEX induced_transcript_rep_idx5 ON "public".induced_transcript_report USING  btree ( tissue );

CREATE INDEX induced_transcript_rep_idx6 ON "public".induced_transcript_report USING  btree ( compound );

CREATE  TABLE "public".lot_report ( 
	id                   integer  NOT NULL  ,
	name                 varchar(30)  NOT NULL  ,
	"map"                integer  NOT NULL  ,
	CONSTRAINT lot_report_pk PRIMARY KEY ( id )
 );

CREATE  TABLE "public".map_report ( 
	id                   integer  NOT NULL  ,
	name                 varchar(20)  NOT NULL  ,
	"type"               varchar(10)  NOT NULL  ,
	layout               varchar(20)    ,
	short_name           varchar(10)  NOT NULL  ,
	CONSTRAINT map_report_pk PRIMARY KEY ( id )
 );

CREATE  TABLE "public".map_spot_expresson_report ( 
	map_spot             integer  NOT NULL  ,
	"map"                integer  NOT NULL  ,
	chip_name            varchar(10)  NOT NULL  ,
	x_coord              integer    ,
	y_coord              integer    ,
	"type"               char(1)  NOT NULL  ,
	probe                integer    ,
	probe_name           varchar(30)    ,
	gene                 integer    ,
	gene_name            varchar(403)    ,
	expresson            integer    
 );

CREATE INDEX map_spot_expresson_rep_idx ON "public".map_spot_expresson_report USING  btree ( map_spot );

CREATE INDEX map_spot_expresson_rep_idx2 ON "public".map_spot_expresson_report USING  btree ( expresson );

CREATE INDEX map_spot_expresson_rep_idx3 ON "public".map_spot_expresson_report USING  btree ( "map" );

CREATE INDEX map_spot_expresson_rep_idx4 ON "public".map_spot_expresson_report USING  btree ( probe );

CREATE INDEX map_spot_expresson_rep_idx5 ON "public".map_spot_expresson_report USING  btree ( gene );

CREATE INDEX map_spot_expresson_rep_idx6 ON "public".map_spot_expresson_report USING  btree ( gene_name, expresson );

CREATE INDEX map_spot_expresson_rep_idx7 ON "public".map_spot_expresson_report USING  btree ( expresson, gene, gene_name, probe, "map" );

CREATE  TABLE "public".motif_cmpd_score_report ( 
	compound             integer  NOT NULL  ,
	motif                numeric(38)  NOT NULL  ,
	motif_name           varchar(301)    ,
	class_name           varchar(200)    ,
	pathway_name         varchar(100)    ,
	sp_score             double precision    ,
	pathway              numeric(38)  NOT NULL  ,
	signature            numeric(38)  NOT NULL  ,
	signature_name       varchar(444)    
 );

CREATE  TABLE "public".motif_exp_score ( 
	id                   integer  NOT NULL  ,
	motif                integer  NOT NULL  ,
	experiment           integer  NOT NULL  ,
	sp_score             numeric(10,3)  NOT NULL  ,
	posterior_probability numeric(10,3)    ,
	logit_probability    numeric(10,3)    
 );

CREATE  TABLE "public".motif_exp_score_report ( 
	motif                numeric(38)  NOT NULL  ,
	motif_name           varchar(301)    ,
	class_name           varchar(200)    ,
	pathway_name         varchar(100)    ,
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)    ,
	sp_score             numeric(10,3)  NOT NULL  ,
	tissue               integer  NOT NULL  ,
	tissue_name          varchar(25)  NOT NULL  ,
	pathway              numeric(38)  NOT NULL  ,
	signature            numeric(38)  NOT NULL  ,
	signature_name       varchar(444)    
 );

CREATE  TABLE "public".motif_gene_report ( 
	motif                numeric(38)  NOT NULL  ,
	probe                integer    ,
	probe_name           varchar(30)    ,
	gene                 integer    ,
	gene_name            varchar(403)    ,
	expresson            integer    ,
	log_ratio            double precision    
 );

CREATE INDEX motif_gene_report_idx01 ON "public".motif_gene_report USING  btree ( motif );

CREATE  TABLE "public".motif_report ( 
	motif                numeric(38)  NOT NULL  ,
	identifier           varchar(200)  NOT NULL  ,
	motif_name           varchar(301)    ,
	class_name           varchar(200)    ,
	pathway_name         varchar(100)    ,
	image_file_name      varchar(100)    ,
	chip_name            varchar(10)  NOT NULL  ,
	tissue               integer  NOT NULL  ,
	tissue_name          varchar(25)  NOT NULL  ,
	label_description    varchar(500)    ,
	total_size           smallint    ,
	positive_class_size  numeric(38)    ,
	negative_class_size  numeric(38)    ,
	excluded_class_size  smallint    ,
	universe_description varchar(200)    ,
	positive_class_description varchar(200)    ,
	negative_class_description varchar(200)    ,
	excluded_class_description varchar(200)    ,
	average_log_odds     double precision    ,
	average_true_positive_per double precision    ,
	average_true_negative_per double precision    ,
	pathway              numeric(38)  NOT NULL  ,
	signature            numeric(38)  NOT NULL  ,
	signature_name       varchar(444)    ,
	bias                 double precision    ,
	mean_positive_test_score double precision    ,
	mean_negative_test_score double precision    ,
	stddev_positive_test_score double precision    ,
	stddev_negative_test_score double precision    ,
	number_positive      numeric(38)    ,
	number_negative      numeric(38)    ,
	stderr_scalar_product double precision    ,
	pos_neg_ratio        double precision    ,
	ess_design           double precision    ,
	motif_version        varchar(200)    ,
	CONSTRAINT motif_report_pk PRIMARY KEY ( motif )
 );

CREATE  TABLE "public".motif_similarity_report ( 
	motif                numeric(38)  NOT NULL  ,
	motif_name           varchar(301)    ,
	cc_score             double precision    ,
	query_motif          numeric(38)  NOT NULL  ,
	query_motif_name     varchar(301)    ,
	query_class_name     varchar(200)    ,
	query_signature      numeric(38)  NOT NULL  ,
	query_signature_name varchar(444)    
 );

CREATE  TABLE "public".pathway_compound_report ( 
	pathway_compound     integer  NOT NULL  ,
	compound             integer    ,
	compound_name        varchar(250)    ,
	mol_structure_2d     integer    ,
	pathway              integer    ,
	pathway_name         varchar(100)    ,
	x_coord              integer    ,
	y_coord              integer    
 );

CREATE INDEX pathway_compound_report_idx1 ON "public".pathway_compound_report USING  btree ( pathway );

CREATE INDEX pathway_compound_report_idx2 ON "public".pathway_compound_report USING  btree ( compound );

CREATE  TABLE "public".pathway_gene_platform_report ( 
	gene                 integer  NOT NULL  ,
	gene_name            varchar(403)    ,
	chip_name            varchar(10)  NOT NULL  ,
	pathway              integer  NOT NULL  ,
	pathway_name         varchar(100)    
 );

CREATE INDEX pathway_gene_platform_rep_idx ON "public".pathway_gene_platform_report USING  btree ( pathway );

CREATE INDEX pathway_gene_platform_rep_idx2 ON "public".pathway_gene_platform_report USING  btree ( gene );

CREATE  TABLE "public".pathway_gene_report ( 
	gene                 integer  NOT NULL  ,
	gene_name            varchar(403)    ,
	pathway              integer  NOT NULL  ,
	pathway_name         varchar(100)    
 );

CREATE INDEX pathway_gene_report_idx ON "public".pathway_gene_report USING  btree ( pathway );

CREATE INDEX pathway_gene_report_idx2 ON "public".pathway_gene_report USING  btree ( gene );

CREATE  TABLE "public".pathway_literature_report ( 
	pathway              integer  NOT NULL  ,
	pathway_name         varchar(100)    ,
	title                varchar(350)  NOT NULL  ,
	pubmed               bigint    
 );

CREATE  TABLE "public".pathway_pathway_report ( 
	pathway              integer  NOT NULL  ,
	pathway_name         varchar(100)    ,
	linked_pathway       integer  NOT NULL  ,
	linked_pathway_name  varchar(100)    
 );

CREATE  TABLE "public".pathway_report ( 
	pathway              integer  NOT NULL  ,
	pathway_name         varchar(100)    ,
	species              integer    ,
	image_file_name      varchar(100)    ,
	description          varchar(4000)    ,
	CONSTRAINT pathway_report_pk PRIMARY KEY ( pathway )
 );

CREATE  TABLE "public".pathway_target_report ( 
	pathway_target       integer  NOT NULL  ,
	gene                 integer  NOT NULL  ,
	gene_name            varchar(300)  NOT NULL  ,
	pathway              integer  NOT NULL  ,
	pathway_name         varchar(100)    ,
	chip_name            varchar(10)  NOT NULL  ,
	x_coord              integer  NOT NULL  ,
	y_coord              integer  NOT NULL  
 );

CREATE INDEX pathway_target_report_idx ON "public".pathway_target_report USING  btree ( pathway );

CREATE INDEX pathway_target_report_idx2 ON "public".pathway_target_report USING  btree ( gene );

CREATE  TABLE "public".pathway_tissue_report ( 
	pathway              integer  NOT NULL  ,
	pathway_name         varchar(100)    ,
	tissue               integer    ,
	tissue_name          varchar(25)  NOT NULL  
 );

CREATE  TABLE "public".pharmacology_report ( 
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)  NOT NULL  ,
	pubmed               bigint    ,
	category             varchar(50)  NOT NULL  ,
	short_category       varchar(5)    ,
	"type"               varchar(30)  NOT NULL  ,
	"value"              varchar(58)    ,
	description          varchar(350)    ,
	reference            varchar(300)    
 );

CREATE INDEX pharmacology_report_idx ON "public".pharmacology_report USING  btree ( compound );

CREATE  TABLE "public".platform_factor ( 
	id                   integer  NOT NULL  ,
	probe                integer  NOT NULL  ,
	factor               numeric(5,4)  NOT NULL  ,
	chip_name            varchar(20)  NOT NULL  
 );

CREATE  TABLE "public".probe_constancy_report ( 
	probe                integer  NOT NULL  ,
	label_name           varchar(200)  NOT NULL  ,
	label_type           varchar(20)  NOT NULL  ,
	tissue               integer  NOT NULL  ,
	tissue_name          varchar(25)  NOT NULL  ,
	indu                 smallint  NOT NULL  ,
	repr                 smallint  NOT NULL  ,
	pert                 smallint  NOT NULL  ,
	dist                 numeric(10,3)  NOT NULL  ,
	avlr                 numeric(10,3)  NOT NULL  
 );

CREATE INDEX probe_constancy_report_idx ON "public".probe_constancy_report USING  btree ( probe, tissue, label_type );

CREATE  TABLE "public".probe_variance_report ( 
	id                   integer  NOT NULL  ,
	chip_name            varchar(10)  NOT NULL  ,
	tissue_name          varchar(20)  NOT NULL  ,
	tissue               integer  NOT NULL  ,
	strain_name          varchar(5)  NOT NULL  ,
	strain               integer  NOT NULL  ,
	"type"               char(1)  NOT NULL  ,
	probe                integer  NOT NULL  ,
	n0                   numeric(6,2)    ,
	var0                 numeric(11,8)    ,
	CONSTRAINT probe_variance_report_pk PRIMARY KEY ( id )
 );

CREATE  TABLE "public".raw_data_report ( 
	hybridization        integer  NOT NULL  ,
	probe                integer  NOT NULL  ,
	probe_name           varchar(30)  NOT NULL  ,
	normalized           numeric(11,3)    ,
	signal               numeric(11,3)    
 );

CREATE INDEX raw_data_report_idx1 ON "public".raw_data_report USING  btree ( hybridization );

CREATE  TABLE "public".replicate_set_lookup ( 
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	replicate_set        integer  NOT NULL  ,
	hybridization        integer  NOT NULL  ,
	experimental_type    char(1)  NOT NULL  ,
	paired_ctl_hyb       integer    ,
	label                varchar(8)  NOT NULL  
 );

CREATE  TABLE "public".replicate_similarity_report ( 
	query_compound       integer  NOT NULL  ,
	query_compound_name  varchar(250)    ,
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)    ,
	mol_structure_2d     integer    ,
	query_experiment     integer  NOT NULL  ,
	query_experiment_name varchar(132)    ,
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	"time"               numeric(6,2)  NOT NULL  ,
	time_unit            char(1)    ,
	dose                 numeric(10,4)  NOT NULL  ,
	dose_unit            varchar(8)  NOT NULL  ,
	organism_description varchar(100)  NOT NULL  ,
	chip_name            varchar(10)  NOT NULL  ,
	percent_induced      numeric(5,2)    ,
	percent_repressed    numeric(5,2)    ,
	percent_perturbed    numeric(5,2)    ,
	"type"               varchar(11)  NOT NULL  ,
	similarity           numeric(10,8)  NOT NULL  ,
	CONSTRAINT replicate_similarity_report_pk PRIMARY KEY ( experiment, query_experiment )
 );

CREATE  TABLE "public".repressed_transcript_report ( 
	gene                 integer  NOT NULL  ,
	gene_name            varchar(403)    ,
	expresson            integer    ,
	differentness        numeric(10,3)    ,
	log_ratio            numeric(10,3)    ,
	adjusted_log_ratio   numeric(10,3)    ,
	stdev_of_log_ratio   numeric(10,3)    ,
	score                numeric(13,12)    ,
	intensity            integer    ,
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	"time"               numeric(6,2)  NOT NULL  ,
	time_unit            char(1)    ,
	dose                 numeric(10,4)  NOT NULL  ,
	dose_unit            varchar(8)  NOT NULL  ,
	organism_description varchar(100)  NOT NULL  ,
	chip_name            varchar(10)  NOT NULL  ,
	"type"               varchar(11)  NOT NULL  ,
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)    ,
	tissue               integer  NOT NULL  ,
	mol_structure_2d     integer    
 );

CREATE  TABLE "public".salgrade ( 
	grade                integer  NOT NULL  ,
	losal                double precision  NOT NULL  ,
	hisal                double precision  NOT NULL  
 );

CREATE  TABLE "public".sample_assay_report ( 
	sample_id            integer    ,
	animal_id            varchar(15)    ,
	assay_name           varchar(100)    ,
	"value"              numeric(10,3)    
 );

CREATE  TABLE "public".sample_histopath_report ( 
	sample_id            integer    ,
	animal_id            varchar(15)    ,
	histopath_name       varchar(121)    ,
	severity             integer    
 );

CREATE  TABLE "public".sample_weight_report ( 
	sample_id            integer    ,
	animal_id            varchar(15)    ,
	study                integer    ,
	term                 varchar(44)    ,
	weight               numeric(6,3)    
 );

CREATE  TABLE "public".score_method_report ( 
	id                   integer  NOT NULL  ,
	name                 varchar(250)  NOT NULL  
 );

CREATE  TABLE "public".signature_cmpd_score_report ( 
	compound             integer  NOT NULL  ,
	signature            numeric(38)  NOT NULL  ,
	signature_name       varchar(444)    ,
	max_score            double precision    ,
	max_posterior        double precision    ,
	max_logit            double precision    ,
	tissue               integer    ,
	tissue_name          varchar(25)    ,
	algorithm            varchar(5)    ,
	chip_name            varchar(10)    ,
	score_method         integer  NOT NULL  ,
	score_method_name    varchar(250)    ,
	category             varchar(5)    ,
	derivation_platform  varchar(10)    ,
	CONSTRAINT signature_cmpd_score_pk PRIMARY KEY ( signature, compound, score_method )
 );

CREATE  TABLE "public".signature_exp_score ( 
	id                   integer  NOT NULL  ,
	signature            integer  NOT NULL  ,
	experiment           integer  NOT NULL  ,
	score                numeric(10,3)  NOT NULL  ,
	score_method         integer  NOT NULL  ,
	posterior_probability numeric(10,3)    ,
	logit_probability    numeric(10,3)    
 );

CREATE  TABLE "public".signature_exp_score_report ( 
	signature            numeric(38)  NOT NULL  ,
	signature_name       varchar(444)    ,
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)    ,
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	score                numeric(10,3)  NOT NULL  ,
	score_method         integer  NOT NULL  ,
	posterior_probability numeric(10,3)    ,
	logit_probability    numeric(10,3)    ,
	tissue               integer  NOT NULL  ,
	tissue_name          varchar(25)  NOT NULL  ,
	algorithm            varchar(5)    ,
	chip_name            varchar(10)  NOT NULL  ,
	derivation_platform  varchar(10)  NOT NULL  ,
	CONSTRAINT signature_exp_score_pk PRIMARY KEY ( signature, experiment, score_method )
 );

CREATE  TABLE "public".signature_gene_report ( 
	signature            numeric(38)  NOT NULL  ,
	signature_name       varchar(444)    ,
	probe                integer    ,
	probe_name           varchar(30)    ,
	gene                 integer    ,
	gene_name            varchar(403)    ,
	mean_t               double precision    ,
	mean_r               double precision    ,
	"scale"              double precision    ,
	weight               double precision    
 );

CREATE  TABLE "public".signature_label_report ( 
	signature            numeric(38)  NOT NULL  ,
	signature_name       varchar(444)    ,
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	label_class          numeric(38)  NOT NULL  
 );

CREATE  TABLE "public".signature_label_report_backup ( 
	signature            numeric(38)  NOT NULL  ,
	signature_name       varchar(444)    ,
	experiment           numeric(38)  NOT NULL  ,
	experiment_name      varchar(132)    ,
	label_class          numeric(38)  NOT NULL  
 );

CREATE  TABLE "public".signature_loaded ( 
	group_identifier     integer    ,
	signature_copy_date  timestamp    
 );

CREATE  TABLE "public".signature_report ( 
	signature            numeric(38)  NOT NULL  ,
	signature_name       varchar(444)    ,
	signature_type       varchar(200)    ,
	identifier           varchar(200)  NOT NULL  ,
	algorithm            varchar(5)    ,
	chip_name            varchar(10)  NOT NULL  ,
	derivation_platform  varchar(10)  NOT NULL  ,
	tissue               integer  NOT NULL  ,
	tissue_name          varchar(25)  NOT NULL  ,
	label_description    varchar(500)    ,
	total_size           smallint    ,
	positive_class_size  numeric(38)    ,
	negative_class_size  numeric(38)    ,
	excluded_class_size  smallint    ,
	universe_description varchar(200)    ,
	positive_class_description varchar(200)    ,
	negative_class_description varchar(200)    ,
	excluded_class_description varchar(200)    ,
	average_log_odds     double precision    ,
	average_true_positive_per double precision    ,
	average_true_negative_per double precision    ,
	category             varchar(5)    ,
	bias                 double precision    ,
	mean_positive_test_score double precision    ,
	mean_negative_test_score double precision    ,
	stddev_positive_test_score double precision    ,
	stddev_negative_test_score double precision    ,
	number_positive      numeric(38)    ,
	number_negative      numeric(38)    ,
	stderr_scalar_product double precision    ,
	pos_neg_ratio        double precision    ,
	ess_design           double precision    ,
	signature_version    varchar(200)    ,
	CONSTRAINT signature_report_pk PRIMARY KEY ( signature )
 );

CREATE  TABLE "public".signature_similarity_report ( 
	signature            numeric(38)  NOT NULL  ,
	signature_name       varchar(444)    ,
	cc_score             numeric(10,3)  NOT NULL  ,
	query_signature      numeric(38)  NOT NULL  ,
	query_signature_name varchar(444)    
 );

CREATE  TABLE "public".signif_histopath_exp_report ( 
	histopathology       integer  NOT NULL  ,
	histopathology_name  varchar(100)  NOT NULL  ,
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	pvalue               numeric(7,6)    
 );

CREATE  TABLE "public".signif_sig_exp_score_report ( 
	signature            numeric(38)  NOT NULL  ,
	signature_name       varchar(444)    ,
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)    ,
	mol_structure_2d     integer    ,
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	sp_score             numeric(10,3)  NOT NULL  ,
	sps_score            numeric(10,3)  NOT NULL  ,
	posterior_probability numeric(10,3)    ,
	logit_probability    numeric(10,3)    ,
	tissue               integer  NOT NULL  ,
	tissue_name          varchar(25)  NOT NULL  ,
	algorithm            varchar(5)    ,
	chip_name            varchar(10)  NOT NULL  ,
	category             varchar(5)    ,
	derivation_platform  varchar(10)  NOT NULL  ,
	CONSTRAINT signif_sig_exp_score_pk PRIMARY KEY ( signature, experiment )
 );

CREATE  TABLE "public".significant_transcript_report ( 
	gene                 integer  NOT NULL  ,
	gene_name            varchar(403)    ,
	expresson            integer    ,
	differentness        numeric(10,3)    ,
	log_ratio            numeric(10,3)    ,
	adjusted_log_ratio   numeric(10,3)    ,
	stdev_of_log_ratio   numeric(10,3)    ,
	score                numeric(13,12)    ,
	intensity            integer    ,
	experiment           integer  NOT NULL  ,
	experiment_name      varchar(132)    ,
	"time"               numeric(6,2)  NOT NULL  ,
	time_unit            char(1)    ,
	dose                 numeric(10,4)  NOT NULL  ,
	dose_unit            varchar(8)  NOT NULL  ,
	organism_description varchar(100)  NOT NULL  ,
	chip_name            varchar(10)  NOT NULL  ,
	"type"               varchar(11)  NOT NULL  ,
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)    ,
	tissue               integer  NOT NULL  ,
	mol_structure_2d     integer    
 );

CREATE  TABLE "public".similarity ( 
	query_replicate_id   integer  NOT NULL  ,
	target_replicate_id  integer  NOT NULL  ,
	score                numeric(10,8)  NOT NULL  ,
	score_method         integer  NOT NULL  
 );

CREATE  TABLE "public".simple_assay_lookup ( 
	term                 varchar(54)  NOT NULL  ,
	id                   integer  NOT NULL  ,
	name                 varchar(54)  NOT NULL  
 );

CREATE  TABLE "public".simple_compound_lookup ( 
	term                 varchar(200)  NOT NULL  ,
	id                   integer  NOT NULL  ,
	name                 varchar(200)  NOT NULL  
 );

CREATE  TABLE "public".simple_experiment_lookup ( 
	term                 varchar(52)  NOT NULL  ,
	id                   integer  NOT NULL  ,
	name                 varchar(52)  NOT NULL  
 );

CREATE  TABLE "public".simple_gene_lookup ( 
	term                 varchar(272)  NOT NULL  ,
	id                   integer  NOT NULL  ,
	name                 varchar(272)  NOT NULL  
 );

CREATE  TABLE "public".simple_histopathology_lookup ( 
	term                 varchar(63)  NOT NULL  ,
	id                   integer  NOT NULL  ,
	name                 varchar(63)  NOT NULL  
 );

CREATE  TABLE "public".simple_motif_lookup ( 
	term                 varchar(120)  NOT NULL  ,
	id                   integer  NOT NULL  ,
	name                 varchar(120)  NOT NULL  
 );

CREATE  TABLE "public".simple_pathway_lookup ( 
	term                 varchar(64)  NOT NULL  ,
	id                   integer  NOT NULL  ,
	name                 varchar(64)  NOT NULL  
 );

CREATE  TABLE "public".simple_probe_lookup ( 
	term                 varchar(287)  NOT NULL  ,
	id                   integer  NOT NULL  ,
	name                 varchar(24)  NOT NULL  
 );

CREATE  TABLE "public".simple_signature_lookup ( 
	term                 varchar(201)  NOT NULL  ,
	id                   integer  NOT NULL  ,
	name                 varchar(90)  NOT NULL  
 );

CREATE  TABLE "public".simple_study_lookup ( 
	term                 varchar(51)  NOT NULL  ,
	id                   integer  NOT NULL  ,
	name                 varchar(51)  NOT NULL  
 );

CREATE  TABLE "public".states ( 
	"state"              text    ,
	capital              text    ,
	pop_mill             double precision    ,
	area_sqm             integer    
 );

CREATE  TABLE "public".study_imagedata ( 
	study                integer  NOT NULL  ,
	study_type           integer  NOT NULL  ,
	xml                  varchar(30)    ,
	"value"              varchar(30)    ,
	tissue               integer  NOT NULL  ,
	tissue_name          varchar(25)  NOT NULL  
 );

CREATE  TABLE "public".study_report ( 
	study                integer  NOT NULL  ,
	study_name           varchar(265)    ,
	compound             integer  NOT NULL  ,
	compound_name        varchar(250)    ,
	mol_structure_2d     integer    ,
	salt_form            varchar(250)    ,
	purity               varchar(41)    ,
	array_technology     varchar(11)    ,
	organism             varchar(5)  NOT NULL  ,
	organism_description varchar(100)  NOT NULL  ,
	ctllabel             varchar(8)    ,
	explabel             varchar(8)    ,
	CONSTRAINT study_report_pk PRIMARY KEY ( study )
 );

CREATE  TABLE "public".target_accession_report ( 
	gene                 integer  NOT NULL  ,
	gene_name            varchar(300)  NOT NULL  ,
	probe                integer  NOT NULL  ,
	reference            varchar(80)  NOT NULL  ,
	"database"           varchar(50)  NOT NULL  ,
	"type"               varchar(20)  NOT NULL  
 );

CREATE  TABLE "public".target_expression_similarity ( 
	gene                 integer    ,
	gene_name            varchar(403)    ,
	"method"             varchar(10)  NOT NULL  ,
	score                numeric(7,2)  NOT NULL  ,
	species              varchar(60)  NOT NULL  ,
	query_gene           integer    ,
	query_gene_name      varchar(403)    
 );

CREATE  TABLE "public".target_report ( 
	gene                 integer  NOT NULL  ,
	gene_name            varchar(300)  NOT NULL  ,
	symbol               varchar(20)    ,
	locuslink            varchar(80)    ,
	unigene              varchar(80)    ,
	description          varchar(1500)    
 );

CREATE  TABLE "public".target_synonym ( 
	category             char(7)    ,
	synonym_name         varchar(255)  NOT NULL  ,
	gene                 integer    ,
	gene_name            varchar(300)  NOT NULL  
 );

COMMENT ON TABLE "public".all_transcript_report IS '$Revision: 1$';

COMMENT ON TABLE "public".animal_annotation_report IS '$Revision: 2$';

COMMENT ON TABLE "public".assay_report IS '$Revision: 2$';

COMMENT ON TABLE "public".assay_target_report IS '$Revision: 2$';

COMMENT ON TABLE "public".blood_report IS '$Revision: 2$';

COMMENT ON TABLE "public".cas_report IS '$Revision: 2$';

COMMENT ON TABLE "public".compound_activity_report IS '$Revision: 2$';

COMMENT ON TABLE "public".compound_curation_report IS '$Revision: 2$';

COMMENT ON TABLE "public".compound_identifier_report IS '$Revision: 2$';

COMMENT ON TABLE "public".compound_literature_report IS '$Revision: 2$';

COMMENT ON TABLE "public".compound_property_report IS '$Revision: 2$';

COMMENT ON TABLE "public".compound_report IS '$Revision: 3$';

COMMENT ON TABLE "public".compound_similarity_report IS '$Revision: 2$';

COMMENT ON TABLE "public".compound_smile_report IS '$Revision: 2$';

COMMENT ON TABLE "public".compound_structure_report IS '$Revision: 2$';

COMMENT ON TABLE "public".compound_synonym_report IS '$Revision: 2$';

COMMENT ON TABLE "public".compound_target_report IS '$Revision: 2$';

COMMENT ON TABLE "public".domain_column IS '$Revision: 3$';

COMMENT ON TABLE "public".dose_justification_report IS '$Revision: 2$';

COMMENT ON TABLE "public".exp_pathway_score_report IS '$Revision: 9$';

COMMENT ON TABLE "public".experiment_condition_report IS '$Revision: 2$';

COMMENT ON TABLE "public".experiment_histopath_counts IS '$Revision: 2$';

COMMENT ON TABLE "public".experiment_organ_relwt_report IS '$Revision: 2$';

COMMENT ON TABLE "public".experiment_pathway_score IS '$Revision: 2$';

COMMENT ON TABLE "public".experiment_sample_report IS '$Revision: 2$';

COMMENT ON TABLE "public".experiment_severity_counts IS '$Revision: 2$';

COMMENT ON TABLE "public".expresson_report IS '$Revision: 2$';

COMMENT ON TABLE "public".gene_activity_report IS '$Revision: 2$';

COMMENT ON TABLE "public".gene_annotation_report IS '$Revision: 3$';

COMMENT ON TABLE "public".gene_identifier_report IS '$Revision: 3$';

COMMENT ON TABLE "public".gene_pathway_report IS '$Revision: 2$';

COMMENT ON TABLE "public".gene_report IS '$Revision: 2$';

COMMENT ON TABLE "public".gene_tissue_report IS '$Revision: 2$';

COMMENT ON TABLE "public".go_report IS '$Revision: 2$';

COMMENT ON TABLE "public".histopath_annotation_report IS '$Revision: 3$';

COMMENT ON TABLE "public".histopath_description_report IS '$Revision: 1$';

COMMENT ON TABLE "public".histopath_severity_report IS '$Revision: 2$';

COMMENT ON TABLE "public".histopathology_exp_report IS '$Revision: 3$';

COMMENT ON TABLE "public".histopathology_image_report IS '$Revision: 4$';

COMMENT ON TABLE "public".histopathology_report IS '$Revision: 4$';

COMMENT ON TABLE "public".histopathology_study_report IS '$Revision: 4$';

COMMENT ON TABLE "public".hybridization_and_image_report IS '$Revision: 2$';

COMMENT ON TABLE "public".hybridization_date_report IS '$Revision: 2$';

COMMENT ON TABLE "public".iconix_users IS '$Revision: 2$';

COMMENT ON TABLE "public".induced_transcript_report IS '$Revision: 2$';

COMMENT ON TABLE "public".lot_report IS '$Revision: 2$';

COMMENT ON TABLE "public".map_report IS '$Revision: 2$';

COMMENT ON TABLE "public".map_spot_expresson_report IS '$Revision: 2$';

COMMENT ON TABLE "public".motif_cmpd_score_report IS '$Revision: 1$';

COMMENT ON TABLE "public".motif_exp_score IS '$Revision: 2$';

COMMENT ON TABLE "public".motif_exp_score_report IS '$Revision: 1$';

COMMENT ON TABLE "public".motif_gene_report IS '$Revision: 2$';

COMMENT ON TABLE "public".motif_report IS '$Revision: 2$';

COMMENT ON TABLE "public".motif_similarity_report IS '$Revision: 2$';

COMMENT ON TABLE "public".pathway_compound_report IS '$Revision: 2$';

COMMENT ON TABLE "public".pathway_gene_platform_report IS '$Revision: 2$';

COMMENT ON TABLE "public".pathway_gene_report IS '$Revision: 2$';

COMMENT ON TABLE "public".pathway_literature_report IS '$Revision: 2$';

COMMENT ON TABLE "public".pathway_pathway_report IS '$Revision: 2$';

COMMENT ON TABLE "public".pathway_report IS '$Revision: 2$';

COMMENT ON TABLE "public".pathway_target_report IS '$Revision: 2$';

COMMENT ON TABLE "public".pathway_tissue_report IS '$Revision: 2$';

COMMENT ON TABLE "public".pharmacology_report IS '$Revision: 2$';

COMMENT ON TABLE "public".platform_factor IS '$Revision: 2$';

COMMENT ON TABLE "public".probe_constancy_report IS '$Revision: 2$';

COMMENT ON TABLE "public".probe_variance_report IS '$Revision: 2$';

COMMENT ON TABLE "public".raw_data_report IS '$Revision: 1$';

COMMENT ON TABLE "public".replicate_set_lookup IS '$Revision: 2$';

COMMENT ON TABLE "public".replicate_similarity_report IS '$Revision: 1$';

COMMENT ON TABLE "public".repressed_transcript_report IS '$Revision: 2$';

COMMENT ON TABLE "public".sample_assay_report IS '$Revision: 3$';

COMMENT ON TABLE "public".sample_histopath_report IS '$Revision: 3$';

COMMENT ON TABLE "public".sample_weight_report IS '$Revision: 3$';

COMMENT ON TABLE "public".score_method_report IS '$Revision: 2$';

COMMENT ON TABLE "public".signature_exp_score IS '$Revision: 2$';

COMMENT ON TABLE "public".signature_exp_score_report IS '$Revision: 3$';

COMMENT ON TABLE "public".signature_gene_report IS '$Revision: 2$';

COMMENT ON TABLE "public".signature_label_report IS '$Revision: 2$';

COMMENT ON TABLE "public".signature_loaded IS '$Revision: 2$';

COMMENT ON TABLE "public".signature_report IS '$Revision: 2$';

COMMENT ON TABLE "public".signature_similarity_report IS '$Revision: 2$';

COMMENT ON TABLE "public".signif_histopath_exp_report IS '$Revision: 3$';

COMMENT ON TABLE "public".signif_sig_exp_score_report IS '$Revision: 2$';

COMMENT ON TABLE "public".significant_transcript_report IS '$Revision: 2$';

COMMENT ON TABLE "public".similarity IS '$Revision: 2$';

COMMENT ON TABLE "public".study_imagedata IS '$Revision: 2$';

COMMENT ON TABLE "public".study_report IS '$Revision: 3$';

COMMENT ON TABLE "public".target_accession_report IS '$Revision: 2$';

COMMENT ON TABLE "public".target_expression_similarity IS '$Revision: 2$';

COMMENT ON TABLE "public".target_report IS '$Revision: 2$';

COMMENT ON TABLE "public".target_synonym IS '$Revision: 2$';
