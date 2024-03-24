#include 'Protheus.ch'
#include 'Totvs.ch'
#include 'RestFul.ch'
#include 'Parmtype.ch'
#include "tbiconn.ch"
/*/{Protheus.doc} Job para buscar
documento de entrada
    @type  Function
    @author João Couto
    @since 28/12/2023
    @version version
    @see (links_or_references)
    /*/

user function jBuscaDoc()
    
    RPCSetType(3)
	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"
	
	    u_uBuscaDocWs()

	RESET ENVIRONMENT

return
/*/{Protheus.doc} 
Função para execurtar o método 
de busca em conexão com API
    @type  Function
    @author João Couto
    @since 28/12/2023
    @version version
    @see (links_or_references)
    /*/
user function uBuscaDocWs()

    local oBuscDoc := BuscaDoc():New_BuscaDoc()
    oBuscDoc:exec_WsBuscaDoc()
return
/*/{Protheus.doc} 
Estrutura da classe e método
    @type  Function
    @author João Couto
    @since 28/12/2023
    @version version
    @see (links_or_references)
    /*/
Class BuscaDoc

    data cError
    data cResult
    data oJson
    method New_BuscaDoc() Constructor 
    method WsBuscaDoc() 
    method exec_WsBuscaDoc()
endclass
/*/{Protheus.doc} Estancimento 
do método
    @type  Function
    @author João Couto
    @since 28/12/2023
    @version version
    @see (links_or_references)
    /*/
method New_BuscaDoc() class BuscaDoc
    
    ::cError    := ""
    ::cResult   := ""   
    ::oJson     := JsonObject():New()
return
/*/{Protheus.doc} Estrutura 
de execução do método
    @type  Function
    @author João Couto
    @since 28/12/2023
    @version version
    @see (links_or_references)
    /*/
method exec_WsBuscaDoc() Class BuscaDoc

    if( Empty( ::cError ) )
            ::WsBuscaDoc()
    endIf 

return

method WsBuscaDoc() Class BuscaDoc

    local aHeader   := {}
    local oRest     := nil
    local nStatus   := 0
    local cError    := ""
    
    oRest := FWRest():New("https://bbee4269-e0f9-40ec-b645-a49a8196adb3-00-3ot0ojtpprab0.riker.replit.dev/DocEntrada")
    oRest:setPath( "" )
   
    if( oRest:Get( aHeader ) )
     cError  := ""
     nStatus := HTTPGetStatus(@cError)

        if( nStatus >= 200 .AND. nStatus <= 299 )

            if( !Empty( oRest:getResult() ) )
                ::cResult := DecodeUtf8( oRest:getResult() )
                

                 
            endif
        else
            ::cError := cError
        endif
    else
        ::cError := DecodeUtf8( oRest:getLastError() ) + iif( !Empty( oRest:getResult() ), CRLF + DecodeUtf8( oRest:getResult() ) , "" )
    endif




::oJson:fromjson(::cResult) 

return ::oJson
