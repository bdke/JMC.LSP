parser grammar JMCParser;

options {
    tokenVocab = 'JMCLexer';
}

program: line* EOF;
line: ifBlock | whileBlock | functionBlock | import_ | COMMENT | statement;
statement: ((functionCall| attrbinbuteAssign | assignment) END) | command ;

ifBlock: IF PAREN_START expression PAREN_END block (ELSE elseIfBlock)?;
elseIfBlock: block | ifBlock;
whileBlock: WHILE PAREN_START expression PAREN_END block;
functionBlock: FUNCTION IDENTIFIER PAREN_START expression* PAREN_END block;
block: BLOCK_START line* BLOCK_END;

attrbinbuteAssign: SELECTOR IMPLY assign attributeJson ;
attributeJson: jsonObj ;

import_: IMPORT STRING END;
assignment: (VARIABLE_IDENTIFIER | scoreboardTarget) (SIMPLE_ADDICTIVE | (assign expression));

functionCall: IDENTIFIER PAREN_START funcArgs? PAREN_END;
funcArgs: (expArgs (SEP specifiedArgs)?) | specifiedArgs;
expArgs: expression (SEP expression)*;
specifiedArgs: specifiedArg (SEP specifiedArg)* ;
specifiedArg: IDENTIFIER ASSIGN expression ;

command: (COMMANDS ~(END | RUN)+) (commandExtend | END);

expression
    : list #ListExression
    | anonymousFunction #AnonymousFunctionExpression
    | constant #ConstantExpression
    | VARIABLE_IDENTIFIER #VariableIdentifierExpression
    | IDENTIFIER #IdentifierExpression
    | functionCall #FunctionCallExpression
    | PAREN_START expression PAREN_END #ParentheziedExpression
    | NOT expression #NotExpression
    | expression MULTIPACATION expression #MultiplicativeExpression
    | expression ADDICTIVE expression #AdditiveExpression
    | expression COMPARASION expression #ComparisonExpression
;

constant: INTEGER | FLOAT | STRING | BOOL | NULL;
assign: ASSIGN_OPERATORS | ASSIGN | COMPARATOR ;

scoreboardTarget: IDENTIFIER COLON SELECTOR;
implyTarget: SELECTOR IMPLY ;

commandExtend: RUN (block | (functionCall END) | command) ;
anonymousFunction: PAREN_START PAREN_END ARROW block;

list: LIST_START listElems? LIST_END ;
listElems: listElem (SEP listElem)* ;
listElem: constant | IDENTIFIER | list;

//json parser
jsonObj: BLOCK_START jsonObjPairs? BLOCK_END ;
jsonObjPairs: jsonPair (SEP jsonPair)* ;
jsonPair: (COMMANDS | IDENTIFIER | STRING) COLON jsonValue ;
jsonList: LIST_START jsonElems? LIST_END;
jsonElems: jsonValue (SEP jsonValue)* ;
jsonValue
    : STRING
    | INTEGER
    | INT_VALUE
    | jsonObj
    | jsonList
    ;