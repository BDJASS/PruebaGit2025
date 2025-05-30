@openapi.openedge.export FILE(type="REST", executionMode="single-run", useReturnValue="false", writeDataSetBeforeImage="false").
/*------------------------------------------------------------------------
    File        : Catalogo Moneda
    Purpose     : /Moneda

    Syntax      : Se usa en Reportes de Cartera

    Nombreiption : 

    Author(s)   : sis10
    Created     : 
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttMoneda NO-UNDO    
    FIELD IdMoneda  AS INT           
    FIELD Nombre    AS CHARACTER 
    FIELD TpoCamb   AS DECIMAL
    FIELD Simbolo   AS CHARACTER 
    INDEX idx-mc  IdMoneda ASCENDING  .

/* **********************  Internal Procedures  *********************** */

@openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
PROCEDURE GetMoneda:
/*------------------------------------------------------------------------------
 Purpose:
 Notes:
------------------------------------------------------------------------------*/
    DEFINE OUTPUT PARAMETER TABLE FOR ttMoneda.
    
    EMPTY TEMP-TABLE ttMoneda.
    FOR EACH Moneda NO-LOCK :
        BUFFER-COPY Moneda TO ttMoneda.    
        ASSIGN 
            ttMoneda.IdMoneda = Moneda.Id-Moneda
            ttMoneda.Nombre   = Moneda.Nombre
            ttMoneda.TpoCamb  = Moneda.TpoCamb
            ttMoneda.Simbolo  = Moneda.Simbolo. 
        RELEASE ttMoneda.
    END.

END PROCEDURE.

