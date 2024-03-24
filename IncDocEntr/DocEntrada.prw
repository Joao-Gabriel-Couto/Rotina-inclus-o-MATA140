#include 'protheus.ch'
#include 'topconn.ch'
#include 'tbiconn.ch'

class DocEntrada

    data OPC_INCLUI
    data OPC_ALTERA
    data OPC_DELETE

    data cCodEmp
    data cFilDoc
    data cSerie
    data cDocumen
    data cFornece
    data cLoja
    data cNome      //A2_NOME
    data cNomFant   //A2_NREDUZ
    data cEnder     //A2_END
    data cCNPJ      //A2_CGC
    data cTipo
    data cFatura
    data cEspecie
    data cCondPgto
    data cFormul
    data dEmissao
    data dDtLanc
    data nSF1Recno
    data cCCusto
    data cNatureza
    data cChaveNfe
    data cTpFrete
    data nValFrte
    data nValDesp
    data nDesconto
    data cTpOri    
    data nPesLiq
    data nPesBrut
    data cVolEspec
    data nVolume

    data aCabec
    data aItAuto
    data aItens

    data cWarning
    data cError
    data nOpc

    data aDados

    method new_DocEntrada() constructor
    method manRegis_PreDocEntr()
    method prepCab_DocEntrada()
    method prepIte_DocEntrada()
    method setByAlias_DocEntrada()
    method prepDados_DocEntrada()
    method Exec_manRegis()
endclass 


method new_DocEntrada() class DocEntrada
    ::OPC_INCLUI    := 3
    ::OPC_ALTERA    := 4
    ::OPC_DELETE    := 5

    ::cCodEmp       := ""
    ::cFilDoc       := xFilial("SF1")
    ::cSerie        := ""
    ::cDocumen      := ""
    ::cFornece      := ""
    ::cLoja         := ""
    ::cTipo         := ""
    ::cFatura       := ""    
    ::nSF1Recno     := 0
    ::cCCusto       := ""
    ::cNatureza     := ""
    ::nPesLiq       := 0
    ::nPesBrut      := 0
    ::cVolEspec     := ""
    ::nVolume       := 0
    ::nValFrte      := 0
    ::nValDesp      := 0
    ::nDesconto     := 0
    ::cTpOri        := ""    

    ::aCabec        := {}
    ::aItAuto       := {}
    ::aItens        := {}

    ::cError        := ""
    ::cWarning      := ""
    ::nOpc          := ::OPC_INCLUI

    ::aDados        := {}    

return
method Exec_manRegis() class DocEntrada

    if( Empty(::cError) )
        ::prepDados_DocEntrada()
    endIf

    if( Empty(::cError) )
        ::manRegis_PreDocEntr()
    endIf
return 
method prepDados_DocEntrada() class DocEntrada   

    if( Empty(::cError) )
        ::prepCab_DocEntrada()
    endIf

    if( Empty(::cError) )
        ::prepIte_DocEntrada()
    endIf
    
return


method prepCab_DocEntrada() class DocEntrada

    if( !Empty(::cFilDoc) )
        AAdd(::aCabec, {"F1_FILIAL"     , ::cFilDoc     , nil})
    endIf

    if( !Empty(::cTipo) )
        AAdd(::aCabec, {"F1_TIPO"       , PadR( ::cTipo     , TamSx3("F1_TIPO")[1])         , nil})
    endIf

    if( !Empty(::cDocumen) )
        AAdd(::aCabec, {"F1_DOC"        , PadR(::cDocumen   , TamSx3("F1_DOC")[1])          , nil})
    endIf

    if( !Empty(::cSerie) )
        AAdd(::aCabec, {"F1_SERIE"      , PadR(::cSerie     , TamSx3("F1_SERIE")[1])        , nil})
    else
        AAdd(::aCabec, {"F1_SERIE"      , Space(TamSx3("F1_SERIE")[1])                      , nil})
    endIf

    if( !Empty(::cFornece) )
        AAdd(::aCabec, {"F1_FORNECE"    , PadR(::cFornece   , TamSx3("F1_FORNECE")[1])      , nil})
    endIf

    if( !Empty(::cLoja) )
        AAdd(::aCabec, {"F1_LOJA"       , PadR(::cLoja      , TamSx3("F1_LOJA")[1])         , nil})
    endIf

    if( !Empty(::cEspecie) )
        AAdd(::aCabec, {"F1_ESPECIE"    , PadR(::cEspecie   , TamSx3("F1_ESPECIE")[1])      , nil})
    endIf

    if( !Empty(::dEmissao) )
        Aadd(::aCabec, {"F1_EMISSAO"    , ::dEmissao                                        , nil})
    else
        Aadd(::aCabec, {"F1_EMISSAO"    , dDataBase                                         , nil})
    endIf

    if( !Empty(::dDtLanc) )
        Aadd(::aCabec, {"F1_DTLANC"     , ::dDtLanc                                         , nil})
    endIf

    if( !Empty(::cChaveNfe) )
        Aadd(::aCabec, {"F1_CHVNFE"    , ::cChaveNfe                                        , nil})
    endIf

    if( !Empty(::cFormul) )
        Aadd(::aCabec, {"F1_FORMUL"     , PadR(::cFormul    , TamSx3("F1_COND")[1])         , nil})
    else
        Aadd(::aCabec, {"F1_FORMUL"     , "N"                                               , nil})
    endIf

    if( !Empty(::nPesLiq) )
        Aadd(::aCabec, {"F1_PLIQUI"     , ::nPesLiq                                         , nil})
    endIf

    if( !Empty(::nPesBrut) )
        Aadd(::aCabec, {"F1_PBRUTO"     , ::nPesBrut                                        , nil})
    endIf

    if( !Empty(::cVolEspec) )
        Aadd(::aCabec, {"F1_ESPECI1"     , PadR(::cVolEspec    , TamSx3("F1_ESPECI1")[1])   , nil})
    endIf

    if( !Empty(::nVolume) )
        Aadd(::aCabec, {"F1_VOLUME1"    , ::nVolume                                         , nil})
    endIf

    if( !Empty(::nValFrte) )
        Aadd(::aCabec, {"F1_FRETE"      , ::nValFrte                                        , nil})
    endIf

    if( !Empty(::nValDesp) )
        Aadd(::aCabec, {"F1_DESPESA"    , ::nValDesp                                        , nil})
    endIf

    if( !Empty(::nDesconto) )
        Aadd(::aCabec, {"F1_DESCONT"    , ::nDesconto                                       , nil})
    endIf

    if( !Empty(::cTpFrete) )
        Aadd(::aCabec, {"F1_TPFRETE"      , PadR(::cTpFrete, TamSx3("F1_TPFRETE")[1])       , nil})
    endIf

    if( !Empty(::cNatureza) )
        Aadd(::aCabec, {"E2_NATUREZ"    , PadR(::cNatureza, TamSx3("E2_NATUREZ")[1])        , nil})
    endIf

    if( !Empty(::cCondPgto) )

        AAdd( ::aCabec, {"F1_COND"       , PadR(::cCondPgto  , TamSx3("F1_COND")[1])         , nil})
    endIf
    
    FwVetByDic( ::aCabec, "SF1" , .F.)
return

method prepIte_DocEntrada() class DocEntrada
    local nI    := 1
    local aItem := {}

    for nI := 1 to Len(::aItens)
        aItem := {}

        if( !Empty(::cFilDoc) )
            AAdd(aItem, {"D1_FILIAL"    , PadR(::cFilDoc    , TamSx3("D1_FILIAL")[1])               , nil})
        endIf

        if( !Empty(::aItens[nI]:cItem) )
            AAdd(aItem, {"D1_ITEM"    , PadR(::aItens[nI]:cItem, TamSx3("D1_ITEM")[1])              , nil})
        else
            AAdd(aItem, {"D1_ITEM"    , StrZero(nI, TamSx3("D1_ITEM")[1])                           , nil})
        endIf

        if( !Empty(::cDocumen) )
            AAdd(aItem, {"D1_DOC"       , PadR(::cDocumen   , TamSx3("D1_DOC")[1])                  , nil})
        endIf

        if( !Empty(::cSerie) )
            AAdd(aItem, {"D1_SERIE"     , PadR(::cSerie     , TamSx3("D1_SERIE")[1])                , nil})
        endIf

        if( !Empty(::cFornece) )
            AAdd(aItem, {"D1_FORNECE"   , PadR(::cFornece   , TamSx3("D1_FORNECE")[1])              , nil})
        endIf

        if( !Empty(::cLoja) )
            AAdd(aItem, {"D1_LOJA"      , PadR(::cLoja      , TamSx3("D1_LOJA")[1])                 , nil})
        endIf

        if( !Empty(::aItens[nI]:cCodProd) )
            AAdd(aItem, {"D1_COD"       , PadR(::aItens[nI]:cCodProd   , TamSx3("D1_COD")[1])      , nil})
        endIf

        if( !Empty(::aItens[nI]:cItem) )
            AAdd(aItem, {"D1_ITEM"      , PadR(::aItens[nI]:cItem       , TamSx3("D1_ITEM")[1])     , nil})
        endIf

        if( !Empty(::aItens[nI]:cNumPed) )            
            AAdd(aItem, {"D1_PEDIDO"    , PadR(::aItens[nI]:cNumPed     , TamSx3("D1_PEDIDO")[1])   , nil})
        endIf

        if( !Empty(::aItens[nI]:cItePed) )
            AAdd(aItem, {"D1_ITEMPC"    , PadR(::aItens[nI]:cItePed     , TamSx3("D1_ITEMPC")[1])   , nil})
        endIf

        if( !Empty(::aItens[nI]:cTES) )
            AAdd(aItem, {"D1_TES"       , PadR(::aItens[nI]:cTES        , TamSx3("D1_TES")[1])      , nil})
        endIf

        if( !Empty(::aItens[nI]:cCCusto) )
            AAdd(aItem, {"D1_CC"       , PadR(::aItens[nI]:cCCusto      , TamSx3("D1_CC")[1])      , nil})
        endIf

        if( !Empty(::aItens[nI]:nQuant) )
            AAdd(aItem, {"D1_QUANT"     , ::aItens[nI]:nQuant                                       , nil})
        endIf

        if( !Empty(::aItens[nI]:nVlUnit) )
            AAdd(aItem, {"D1_VUNIT"     , ::aItens[nI]:nVlUnit                                      , nil})
        endIf

        if( !Empty(::aItens[nI]:nVlTot) )
            AAdd(aItem, {"D1_TOTAL"     , ::aItens[nI]:nVlTot                                       , nil})
        endIf

        if( !Empty(::aItens[nI]:cTES) )
            AAdd(aItem, {"D1_TES"       , PadR(::aItens[nI]:cTES        , TamSx3("D1_TES")[1])      , nil})
        endIf

        if( ::aItens[nI]:lValSol )
            AAdd(aItem, {"D1_ICMSRET"   , ::aItens[nI]:nValSol                                      , nil})
        endIf

        if( ::aItens[nI]:lBasReduz )
            AAdd(aItem, {"D1_BRICMS"    , ::aItens[nI]:nBasReduz                                    , nil})
        endIf

        if( ::aItens[nI]:lBasICMS )
            AAdd(aItem, {"D1_BASEICM"   , ::aItens[nI]:nBasICMS                                     , nil})
        endIf

        if( ::aItens[nI]:lAliqICMS )
            AAdd(aItem, {"D1_PICM"      , ::aItens[nI]:nAliqICMS                                    , nil})
        endIf

        if( ::aItens[nI]:lValICMS )
            AAdd(aItem, {"D1_VALICM"    , ::aItens[nI]:nValICMS                                     , nil})
        endIf

        if( ::aItens[nI]:lValCofins )
            AAdd(aItem, {"D1_VALIMP5"   , ::aItens[nI]:nValCofins                                   , nil})
        endIf

        if( ::aItens[nI]:lValPis )
            AAdd(aItem, {"D1_VALIMP6"   , ::aItens[nI]:nValPis                                      , nil})
        endIf

        if( ::aItens[nI]:lBaseIpi )
            AAdd(aItem, {"D1_BASEIPI"   , ::aItens[nI]:nBaseIpi                                     , nil})
        endIf

        if( ::aItens[nI]:lAliqIpi )
            AAdd(aItem, {"D1_IPI"       , ::aItens[nI]:nAliqIpi                                     , nil})
        endIf

        if( ::aItens[nI]:lValIpi )
            AAdd(aItem, {"D1_VALIPI"    , ::aItens[nI]:nValIpi                                      , nil})
        endIf

        if( !Empty(::aItens[nI]:cNFOri) )
            AAdd(aItem, {"D1_NFORI"     , PadR(::aItens[nI]:cNFOri        , TamSx3("D1_NFORI")[1])    , nil})
        else
            AAdd(aItem, {"D1_NFORI"     , Space(TamSx3("D1_NFORI")[1])                              , nil})
        endIf

        if( !Empty(::aItens[nI]:cSerOri) )
            AAdd(aItem, {"D1_SERIORI"   , PadR(::aItens[nI]:cSerOri     , TamSx3("D1_SERIORI")[1])  , nil})
        else
            AAdd(aItem, {"D1_SERIORI"   , Space(TamSx3("D1_SERIORI")[1])                            , nil})
        endIf

        if( !Empty(::aItens[nI]:cItemCta) )
            AAdd(aItem, {"D1_ITEMCTA"   , PadR(::aItens[nI]:cItemCta    , TamSx3("D1_ITEMCTA")[1])  , nil})
        endIf

        if( !Empty(::aItens[nI]:cClVl) )
            AAdd(aItem, {"D1_CLVL"      , PadR(::aItens[nI]:cClVl       , TamSx3("D1_CLVL")[1])     , nil})
        endIf

        AAdd(aItem, {"AUTDELETA","N", nil})

        AAdd(::aItAuto, aItem)

    next

return

method setByAlias_DocEntrada() class DocEntrada
    ::cCodEmp   := cEmpAnt
    ::cFilDoc   := SF1->F1_FILIAL
    ::cTipo     := SF1->F1_TIPO
    ::cDocumen  := SF1->F1_DOC
    ::cSerie    := SF1->F1_SERIE
    ::cFornece  := SF1->F1_FORNECE
    ::cLoja     := SF1->F1_LOJA
    ::cEspecie  := SF1->F1_ESPECIE
    ::dEmissao  := SF1->F1_EMISSAO
    ::dDtLanc   := SF1->F1_DTLANC
    ::cChaveNfe := SF1->F1_CHVNFE
    ::cNome     := SF1->A2_NOME
    ::cNomFant  := SF1->A2_NREDUZ
    ::cEnder    := SF1->A2_END
    ::cCNPJ     := SF1->A2_CGC
return

method manRegis_PreDocEntr() class DocEntrada
    local   aResult     := nil
    private lMsErroAuto := .F.
    private lMsHelpAuto := .T.
    
    if( Empty(::cError) ) 
        MSExecAuto({|x, y, z| MATA140(x, y , z)}, ::aCabec, ::aItAuto, ::nOpc)
    endIf

    if (lMsErroAuto)           
        aResult := MostraErro()
    else
        conout("Pedido de venda incluido com sucesso!")
             
    endif 

return
