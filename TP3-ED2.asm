#include <p16f887.inc>

    __CONFIG _CONFIG1, _XT_OSC & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_OFF & _IESO_OFF & _FCMEN_OFF & _LVP_OFF
    __CONFIG _CONFIG2, _BOR40V & _WRT_OFF
    
    LIST p=16F887 

    D1          EQU 0x21
    D2          EQU 0x22
    D3          EQU 0x23
    D4          EQU 0x24
    INDEX       EQU 0x25
    TIEMPO0     EQU 0x26
    TIEMPO1     EQU 0x27
    TIEMPO2     EQU 0x28
    W_TEMP      EQU 0x70 
    STATUS_TEMP EQU 0x71 
 
    ORG 0x00 
    GOTO INICIO 

    ORG 0x04
ISR_TMR0 
    MOVWF W_TEMP 
    SWAPF STATUS, W 
    MOVWF STATUS_TEMP 

    CLRF PORTC          
    CLRF PORTD          

    MOVLW 0x21          
    ADDWF INDEX, W      
    MOVWF FSR           

    MOVF INDF, W        
    CALL TABLA_DISPLAY  
    MOVWF PORTD         

    MOVF INDEX, W       
    CALL TABLA_TR       
    MOVWF PORTC         

    INCF INDEX, F       
    MOVLW 0x03          
    XORWF INDEX, W      
    BTFSC STATUS, Z     
    CLRF INDEX          

    BCF INTCON, T0IF    
    MOVLW .178          
    MOVWF TMR0          

    SWAPF STATUS_TEMP, W
    MOVWF STATUS
    SWAPF W_TEMP, F
    SWAPF W_TEMP, W
    RETFIE                               

    ORG 0x30            
INICIO
    BSF STATUS, RP0
    BSF STATUS, RP1     
    CLRF ANSEL          
    CLRF ANSELH         
     
    BSF STATUS, RP0
    BCF STATUS, RP1     
    CLRF TRISD          
    CLRF TRISC          
    
    MOVLW B'11010101'   
    MOVWF OPTION_REG
     
    BCF STATUS, RP0     
    
    MOVLW .178          
    MOVWF TMR0
    
    CLRF PORTD 
    CLRF PORTC
    CLRF INDEX
    CLRF D1 
    CLRF D2
    CLRF D3
    CLRF D4
    
    BSF INTCON, T0IE    
    BSF INTCON, GIE     

MAIN 
     CALL RETARDO 

     INCF D1, F          
     MOVLW .10           
     XORWF D1, W         
     BTFSS STATUS, Z     
     GOTO MAIN           

     CLRF D1             
     INCF D2, F          
     MOVLW .10           
     XORWF D2, W         
     BTFSS STATUS, Z     
     GOTO MAIN           

     CLRF D2             
     INCF D3, F          
     MOVLW .10           
     XORWF D3, W         
     BTFSS STATUS, Z     
     GOTO MAIN           

     CLRF D3             
     INCF D4, F          
     MOVLW .10           
     XORWF D4, W         
     BTFSS STATUS, Z     
     GOTO MAIN           

     CLRF D4             
     GOTO MAIN

RETARDO
     MOVLW D'6'          
     MOVWF TIEMPO2 
BUCLE_EXTERNO      
     MOVLW D'111'       
     MOVWF TIEMPO1  
BUCLE_MEDIO    
     MOVLW D'250'       
     MOVWF TIEMPO0
BUCLE_INTERNO
     DECFSZ TIEMPO0,F   
     GOTO BUCLE_INTERNO 
     DECFSZ TIEMPO1, F  
     GOTO BUCLE_MEDIO 
     DECFSZ TIEMPO2, F  
     GOTO BUCLE_EXTERNO
     RETURN 

TABLA_DISPLAY 
     ADDWF PCL, F         
     RETLW B'00111111'
     RETLW B'00000110'
     RETLW B'01011011'
     RETLW B'01001111'
     RETLW B'01100110'
     RETLW B'01101101'
     RETLW B'01111101'
     RETLW B'00000111'
     RETLW B'01111111'
     RETLW B'01101111'

TABLA_TR
     ADDWF PCL, F
     RETLW B'00000001'
     RETLW B'00000010'
     RETLW B'00000100'
     RETLW B'00001000'

     END
