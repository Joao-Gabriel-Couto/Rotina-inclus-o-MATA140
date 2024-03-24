#include "topconn.ch"
#include "totvs.ch"
#include "tbiconn.ch"

 
user function jIncDocEntrada()

	RPCSetType(3)
	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"
	
	    u_uIncDocEntrada()

	RESET ENVIRONMENT

return


user function uIncDocEntrada()
    local oTst := IncDocEntrada():new_IncDocEntrada()

    oTst:Exec_DocInc()

return


class IncDocEntrada
    
    data oDocEntrada 
    data oRet
    data oExeWs
    data oRetItens

    data cError

    method new_IncDocEntrada() constructor
    method get_IncDocEntrada()
    method Exec_DocInc()
    method Exec_getDoc()
endClass


method new_IncDocEntrada() class IncDocEntrada

    ::oDocEntrada := DocEntrada():new_DocEntrada()
    
    ::cError      := ""  

    ::oRet        := JsonObject():New()
    ::oExeWs      := BuscaDoc():New_BuscaDoc()
    ::oRetItens   := JsonObject():New()
return

method Exec_DocInc() class IncDocEntrada

    if (Empty(::cError))
        ::Exec_getDoc()
    endif 

    if (Empty(::cError))
        ::get_IncDocEntrada()
    endif   

return 
method Exec_getDoc() class IncDocEntrada

    ::oRet := ::oExeWs:WsBuscaDoc()
    ::oRetItens := ::oRet["Itens"]
return 

method get_IncDocEntrada() class IncDocEntrada
        local oItem := nil
        local nI   
        ::oDocEntrada:cFilDoc   := xFilial("SF1")
        ::oDocEntrada:cDocumen  := ::oRet["Documento"]
        ::oDocEntrada:cSerie    := ::oRet["Serie"]
        ::oDocEntrada:cEspecie  := ::oRet["Especie"]
        ::oDocEntrada:cFornece  := ::oRet["Fornece"]
        ::oDocEntrada:cLoja     := ::oRet["Loja"]
        ::oDocEntrada:cCondPgto := ::oRet["CondPgto"]
        ::oDocEntrada:cTipo     := ::oRet["Tipo"]

        //Adicionar item 001
        for nI := 1 to Len(::oRetItens)            
            oItem           := DocItEntrada():new_DocItEntrada()
            oItem:cFilDoc   := xFilial("SD1")
            oItem:cItem     := ::oRetItens[nI]["NumItem"]
            oItem:cCodProd  := ::oRetItens[nI]["Produto"]
            oItem:nVlUnit   := Val(::oRetItens[nI]["PrecVen"])
            oItem:nQuant    := Val(::oRetItens[nI]["Quantidade"])
            oItem:nVlTot    := Val(::oRetItens[nI]["ValorTotal"])
            oItem:cTES      := ::oRetItens[nI]["TES"]

            AAdd( ::oDocEntrada:aItens, oItem )
        Next nI
        ::oDocEntrada:Exec_manRegis()

return

