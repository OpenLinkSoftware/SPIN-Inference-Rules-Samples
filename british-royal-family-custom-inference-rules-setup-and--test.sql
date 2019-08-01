-- Raw Data

-- Cleanup

SPARQL 
CLEAR GRAPH <urn:spin:nanotation:demo:royal:family> ;


SPARQL
PREFIX  rel:  <http://purl.org/vocab/relationship/> 
PREFIX wdrs: <http://www.w3.org/2007/05/powder-s#> 

WITH <urn:spin:nanotation:demo:royal:family>
INSERT
		 {
		 			
			 		## Custom Entity Relationship Types (Relations) ##
	 
			 <#hasUncle>
			 a rdf:Property ;
			 rdfs:label "hasUncle" ;
			 rdfs:comment """Relationship Type that's derived from a SPARQL-based Custom Inference Rule
			 			   that associates a Person with a Male Person that's a sibling of one of their Parents. 
						  """ ;
			 rdfs:domain <#RoyalPerson> ;
			 rdfs:range <#MalePerson> ;
			 wdrs:describedby <#> .
	 
			 <#hasAuntie>
			 a rdf:Property ;
			 rdfs:label "hasAuntie" ;
			 rdfs:comment """Relationship Type that's derived from a SPARQL-based Custom Inference Rule
			 			   that associates a Person with a Female Person that's a sibling of one of their Parents. 
						  """ ;
 			 rdfs:domain <#RoyalPerson> ;
 			 rdfs:range <#FemalePerson> ;
			 wdrs:describedby <#> .
	 
			 <#hasCousin> 
			 a rdf:Property ;
			 rdfs:label "hasCousin" ;
			 rdfs:comment """Relationship Type that's derived from a SPARQL-based Custom Inference Rule
			 			     that associates a Person with another Person; that's a child of the sibling of one of their Parents.
						  """ ;
  			 rdfs:domain <#RoyalPerson> ;
  			 rdfs:range <#FemalePerson> ;
			 wdrs:describedby <#> .

	 
			 		## Custom Entity Types (Classes) ##
	 
			 <#RoyalPerson>
			 rdfs:subClassOf foaf:Person, schema:Person ;
			 rdfs:label "Person Class" ;
			 rdfs:comment """
			 			   A person that inherits properties of both the foaf:Person and schema:Person classes from
						   their respective vocabularies. The properties of this class are defined using custom inference 
						   rules using SPARQL via .""" ;
			 wdrs:describedby <#> .
	 
			 <#FemalePerson>
			 rdfs:subClassOf <#RoyalPerson> ;
			 rdfs:label "Female Person Class" ;
			 rdfs:comment """
			 			   A female person that inherits properties of the Person class identified by relative URI: <#RoyalPerson>.
						   The properties of this class are defined using custom inference rules using SPARQL via .
						   """ ;
			 wdrs:describedby <#> .
	 
			 <#MalePerson>
			 rdfs:subClassOf <#RoyalPerson> ;
			 rdfs:label "Male Person Class" ;
			 rdfs:comment """
			 			   A male person that inherits properties of the Person class identified by relative URI: <#RoyalPerson>.
						   The properties of this class are defined using custom inference rules using SPARQL via .
						   """ ;
			 wdrs:describedby <#> .
		 
			 			## Entity Relationships ##
					
			  <http://dbpedia.org/resource/Prince_William_of_Wales> 
			  a <#RoyalPerson>, <#MalePerson> ;
			  schema:name "Prince William" ;
			  rel:siblingOf <http://dbpedia.org/resource/Prince_Harry_of_Wales> .
									  					
			  <http://dbpedia.org/resource/Elizabeth_Bowes-Lyon> 
			  a <#RoyalPerson>, <#FemalePerson> ;
			  schema:name "Queen Mother" ;
			  rel:parentOf <http://dbpedia.org/resource/Elizabeth_II_of_the_United_Kingdom> .
								
			  <http://dbpedia.org/resource/Elizabeth_II_of_the_United_Kingdom> 
			  a <#RoyalPerson>, <#FemalePerson> ;
			  schema:name "Queen Elizabeth II" ;
			  rel:parentOf <http://dbpedia.org/resource/Charles,_Prince_of_Wales>,
						   <http://dbpedia.org/resource/Anne,_Princess_Royal>, 
						   <http://dbpedia.org/resource/Prince_Andrew,_Duke_of_York>, 
						   <http://dbpedia.org/resource/Prince_Edward,_Earl_of_Wessex> ;
			  rel:siblingOf <http://dbpedia.org/resource/Princess_Margaret,_Countess_of_Snowdon> .
								
			  <http://dbpedia.org/resource/Charles,_Prince_of_Wales> 
			  a <#RoyalPerson>, <#MalePerson> ;
			  schema:name "Prince Charles" ;
			  rel:parentOf <http://dbpedia.org/resource/Prince_William_of_Wales> , 
			  <http://dbpedia.org/resource/Prince_Harry_of_Wales> .
								
			 <http://dbpedia.org/resource/Princess_Margaret,_Countess_of_Snowdon> 
			 a <#RoyalPerson>, <#FemalePerson> ;
			 schema:name "Princess Margaret" . 
			 
			 <http://dbpedia.org/resource/Anne,_Princess_Royal> 
			 a <#RoyalPerson>, <#FemalePerson> ;
			 schema:name "Princess Anne" ;
			 rel:parentOf <http://dbpedia.org/resource/Peter_Phillips>, <http://dbpedia.org/resource/Zara_Phillips> .
								
			 <http://dbpedia.org/resource/Zara_Phillips> 
			 a <#RoyalPerson>, <#FemalePerson> ;
			 schema:name "Princess Zara Phillips" .
			 
			 <http://dbpedia.org/resource/Princess_Beatrice_of_York>  
			 a <#RoyalPerson>, <#FemalePerson> ;
			 schema:name "Princess Beatrice" .
			 
			 <http://dbpedia.org/resource/Princess_Eugenie_of_York>
			 a <#RoyalPerson>, <#FemalePerson> ;
			 schema:name "Princess Eugenie" .
			 
			 <http://dbpedia.org/resource/Prince_Andrew,_Duke_of_York> 
			 a <#RoyalPerson>, <#MalePerson> ;
			 schema:name "Prince Andrew" ;
			 rel:parentOf <http://dbpedia.org/resource/Princess_Eugenie_of_York>, 
			 <http://dbpedia.org/resource/Princess_Beatrice_of_York> .
								
			 <http://dbpedia.org/resource/Prince_Edward,_Earl_of_Wessex> 
			 a <#RoyalPerson>, <#MalePerson> ;
			 schema:name "Prince Edward" .
			 
			 <http://dbpedia.org/resource/Prince_Harry_of_Wales> 
			 a <#RoyalPerson>, <#MalePerson> ;
			 schema:name "Prince Harry" .
			 
			 <http://dbpedia.org/resource/Peter_Phillips> 
			 a <#RoyalPerson>, <#MalePerson> ;
			 schema:name "Prince Peter Phillips" . 
			
			 
		} ;

-- Load Relationship Vocabulary Data

SPARQL 
CLEAR GRAPH <http://purl.org/vocab/relationship/> ;

SPARQL

DEFINE get:soft "no-sponge"
SELECT * 
FROM <http://purl.org/vocab/relationship/> 
WHERE { ?s ?p ?o };

-- Custom Inference Rules using SPIN 

-- For newer release of SPIN Engine
-- SPARQL DROP SPIN LIBRARY <urn:spin:nanotation:demo:royal:family:lib> ; 

SPARQL DROP MACRO  LIBRARY <urn:spin:nanotation:demo:royal:family:lib> ; 

SPARQL

PREFIX  rel:  <http://purl.org/vocab/relationship/> 

CREATE SPIN LIBRARY <urn:spin:nanotation:demo:royal:family:lib> {
  CLASS <#RoyalPerson> {
    				comment """
								Class instance generated from a Macro that customizes relations such as
								rel:siblingOf while introducing new relations such as <#hasAuntie>, <#hasUncle>, and <#hasCousin> . 
							"""
					
     			   	defmacro rel:ancestorOf { ?this rel:ancestorOf ?n } 
											{{ 
												{ ?this rel:parentOf+ ?n . }
												UNION 
												{ ?this rel:siblingOf ?n . }
												FILTER ( NOT EXISTS {?this rel:siblingOf|^rel:siblingOf ?n} )			

											}}
											
	 			   	defmacro rel:descendantOf { ?this rel:descendantOf ?n } 
											{{ 
												{ ?this ^rel:parentOf+ ?n . }		

											}}
											
     			   	defmacro rel:sibingOf  { ?this rel:siblingOf ?n } 
										   {{ 
										   	  [] rel:parentOf ?this, ?n.  
										         FILTER (?n != ?this) .
										   }}
										   
				   	defmacro <#hasAuntie>  { ?this <#hasAuntie> ?n } 
										  {{				 
											  [] rel:parentOf ?this ; 
											     # rel:siblingOf | ^rel:sinblingOf ?n . 
												 rel:siblingOf ?n . 
												 ?n a <#FemalePerson> .
										  }}	
										  	
  				   	defmacro <#hasUncle>  { ?this <#hasUncle> ?n } 
  										  {{				 
  											  [] rel:parentOf ?this ; 
  											     # rel:siblingOf | ^rel:sinblingOf ?n .
												 rel:siblingOf ?n . 
  												 ?n a <#MalePerson> .
  										  }}	
										  
				   	defmacro <#hasCousin>  { ?this <#hasCousin> ?n } 
										  {{				 
											  [] rel:parentOf ?n ;  
											     rel:siblingOf [ rel:parentOf ?this ] .
										  }}			   									   
    			}
}
ASK FROM virtrdf: 
WHERE { ?s <nosuch> ?o } ;

-- Test 1 

SPARQL 

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT ?person rel:ancestorOf as ?relation ?descendant
WHERE { ?person a <#RoyalPerson> ; 
           rel:ancestorOf ?descendant
	  } ;

-- Test 2
	  
SPARQL 

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT DISTINCT ?person rel:siblingOf as ?relation ?siblingOf
WHERE { ?person  a <#RoyalPerson> ; 
         rel:siblingOf  ?siblingOf  
  } ;
  
	
-- Test 3

SPARQL 

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT ?person <#hasAuntie> as ?relation  ?hasAuntie
WHERE { ?person a <#RoyalPerson> ; 
       <#hasAuntie> ?hasAuntie
} ;

-- Test 4

SPARQL 

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT ?person <#hasUncle> as ?relation ?hasUncle
WHERE { ?person a <#RoyalPerson> ; 
       <#hasUncle> ?hasUncle
} ;


-- Test 5

SPARQL 

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT ?person <#hasCousin> as ?relation ?hasCousin
WHERE { ?person a <#RoyalPerson> ; 
       <#hasCousin> ?hasCousin 
} ;


-- Test 6

SPARQL 

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT ?s as ?ancestor 
       ?descendant
WHERE { ?s a <#RoyalPerson> ; 
       rel:ancestorOf ?descendant 
};


-- Test 7

SPARQL

DEFINE input:macro-lib <urn:spin:nanotation:demo:royal:family:lib>  
PREFIX  rel:  <http://purl.org/vocab/relationship/> 

WITH <urn:spin:nanotation:demo:royal:family>
SELECT DISTINCT *
	   
WHERE { 
		{ ?parent a <#RoyalPerson> ; rel:parentOf ?parentOf .} 
		
		UNION 
        
		{ ?person a <#RoyalPerson>; <#hasAuntie> ?hasAuntie .} 
        
		UNION 
        
		{ ?person a <#RoyalPerson>; <#hasUncle> ?hasUncle .} 
		
		UNION 
        
		{ ?person a <#RoyalPerson>; <#hasCousin> ?hasCousin .} 
		
		UNION 
        
		{ ?person a <#RoyalPerson>; rel:siblingOf ?hasSibling . } 
		
		UNION 
               
	    { ?person a <#RoyalPerson>; rel:ancestorOf ?hasDescendant . } 


	  } ;
	  
COMMIT WORK ;

