#include 'protheus.ch'
#include 'topconn.ch'
#include 'tbiconn.ch'

class DocItEntrada
    data cCodEmp
    data cFilDoc
    data cSerie
    data cDocumen
    data cFornece
    data cLoja
    data cTipo
    
    data cItem
    data cCodProd
    data nDesconto
    data nQuant
    data nVlUnit
    data nVlTot
    data cTES
    data cNFOri
    data cSerOri
    data cCCusto
    data cItemCta
    data cClVl
    data cNumPed
    data cItePed
        
    data lValSol
    data nValSol
    
    data lBasReduz
    data nBasReduz

    data lBasICMS
    data nBasICMS
    
    data lAliqICMS
    data nAliqICMS

    data lValICMS
    data nValICMS
    
    data lValCofins
    data nValCofins

    data lValPis
    data nValPis
    
    data lAliqIpi
    data nAliqIpi
    
    data lValIpi
    data nValIpi

    data lBaseIpi
    data nBaseIpi

    data cError
    data aDados

    method new_DocItEntrada() constructor 
    method getByDocumento_DocItEntrada()
    method setByAlias_DocItEntrada()
    
    
    
endClass

method new_DocItEntrada() class DocItEntrada
    ::cFilDoc       := xFilial("SF1")
    ::cSerie        := ""
    ::cDocumen      := ""
    ::cFornece      := ""
    ::cLoja         := ""
    ::cTipo         := ""
    ::cCodProd      := ""
    ::nDesconto     := 0
    ::cNFOri        := ""
    ::cSerOri       := ""
    ::cCCusto       := ""
    ::cItemCta      := ""
    ::cClVl         := ""
    ::cNumPed       := ""    
    ::cItePed       := ""    
    
    ::nValSol       := 0
    ::nBasReduz     := 0

    ::nBasICMS      := 0
    ::nAliqICMS     := 0
    ::nValICMS      := 0
    
    ::nValCofins    := 0
    ::nValPis       := 0
    
    ::nAliqIpi      := 0
    ::nValIpi       := 0

    ::lValSol       := .F.
    ::lBasReduz     := .F.
    ::lBasICMS      := .F.
    ::lAliqICMS     := .F.
    ::lValICMS      := .F.  
    ::lValCofins    := .F.
    ::lValPis       := .F.   
    ::lAliqIpi      := .F.
    ::lValIpi       := .F.
    ::lBaseIpi      := .F.

    ::cError        := ""
    
    ::aDados        := {}
return
method setByAlias_DocItEntrada() class DocItEntrada
    ::cCodEmp       := cEmpAnt
    ::cFilDoc       := SD1->D1_FILIAL
    ::cTipo         := SD1->D1_TIPO
    ::cDocumen      := SD1->D1_DOC
    ::cSerie        := SD1->D1_SERIE
    ::cFornece      := SD1->D1_FORNECE
    ::cLoja         := SD1->D1_LOJA
    ::cItem         := SD1->D1_ITEM
    ::cCodProd      := SD1->D1_COD
    ::nQuant        := SD1->D1_QUANT
    ::nVlUnit       := SD1->D1_VUNIT
    ::nVlTot        := SD1->D1_TOTAL
    ::cTES          := SD1->D1_TES
    ::cNFOri        := SD1->D1_NFORI
    ::cSerOri       := SD1->D1_SERIORI
    ::cCCusto       := SD1->D1_CC
    ::cItemCta      := SD1->D1_ITEMCTA
    ::cClVl         := SD1->D1_CLVL
    ::cNumPed       := SD1->D1_PEDIDO
    ::cItePed       := SD1->D1_ITEMPC

    ::nValSol       := SD1->D1_ICMSRET
    ::nBasReduz     := SD1->D1_BRICMS

    ::nBasICMS      := SD1->D1_BASEICM
    ::nAliqICMS     := SD1->D1_PICM
    ::nValICMS      := SD1->D1_VALICM
    
    ::nValCofins    := SD1->D1_VALIMP5
    ::nValPis       := SD1->D1_VALIMP6
    
    ::nAliqIpi      := SD1->D1_IPI
    ::nValIpi       := SD1->D1_VALIPI
    ::nBasIpi       := SD1->D1_BASEIPI
    
return
