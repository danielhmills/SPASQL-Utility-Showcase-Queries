SPARQL CLEAR GRAPH <urn:qa:ifr:kbpedia:mime-artist:tbox>;
SPARQL CLEAR GRAPH <urn:qa:ifr:wikidata:mime-artist:tbox>;
SPARQL CLEAR GRAPH <urn:qa:ifr:wikidata:mime-artist:abox>;

-- Built-in inference rules

DELETE
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules' ;


SPARQL
INSERT {
         GRAPH <https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip> 
            {
                <http://kbpedia.org/kko/rc/Mime-Actor> owl:equivalentClass <http://www.wikidata.org/entity/Q674067> .
                <http://www.wikidata.org/prop/direct/P106> rdfs:subPropertyOf rdf:type .
                owl:equivalentProperty a owl:TransitiveProperty . 
                owl:equivalentClass a owl:TransitiveProperty.  
                rdfs:subPropertyOf a owl:TransitiveProperty .
                rdfs:subClassOf a owl:TransitiveProperty . 
            }
       } ;

RDFS_RULE_SET ('urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules', 'https://github.com/Cognonto/kbpedia/raw/master/versions/2.50/kbpedia_reference_concepts.zip') ;

SELECT *
FROM DB.DBA.SYS_RDF_SCHEMA
WHERE RS_NAME = 'urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules' ;

-- Tests

-- 1.1 Test using class kbpedia:Mime-Actor


SPARQL
DEFINE input:inference 'urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>


SELECT COUNT(*)
WHERE {
                ?s a kbpedia:Mime-Actor .
          } ;


-- Test 1.2: without reasoning

SPARQL
# DEFINE input:inference 'urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules'
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE {
                ?s a kbpedia:Mime-Actor .
          } ;

-- Tests

-- 2.1 Test using class wdt:Q674067

SPARQL
DEFINE input:inference 'urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules'

PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>


SELECT COUNT(*)
WHERE {
                ?s a <http://www.wikidata.org/entity/Q674067> .
          } ;

-- Test 2.2: without reasoning
SPARQL
# DEFINE input:inference 'urn:kbpedia:mime-artist:owl:equivalent:class:subproperty:inference:rules'
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX bmo: <http://purl.org/bmo/ns#>
PREFIX schema: <http://schema.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX kbpedia: <http://kbpedia.org/kko/rc/>

SELECT COUNT(*)
WHERE {
                ?s a <http://www.wikidata.org/entity/Q674067> .
          } ;