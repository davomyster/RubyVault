#This is needed in order to successfully launch an XML
#entity expansion attack
require "rexml/document"
REXML::Document.entity_expansion_limit=(99999999999999)
