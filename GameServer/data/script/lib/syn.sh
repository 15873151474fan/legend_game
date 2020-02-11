#!/bin/env sh

VALUE_FILE="../../ScenesServer/SceneEntryValue.h"

alias grep='grep --color'
grep "VALUE_TYPE_" $VALUE_FILE |sed -e's/\/\//--/g'|sed -e's/,//g' > valueType.lua
cat valueType.lua


ITEM_FILE="../../common/Item.h"
TARGET="./item.lua"

grep "Item_Attribute_.*=" $ITEM_FILE |sed -e's/\/\//--/g'|sed -e's/^\s*//g' |sed -e's/,//g'> temp1
LINE=`sed -n -e '/Item_Base_Max\s/=' $TARGET`
head -n $LINE $TARGET > temp2
cat temp2 > $TARGET
cat temp1 >> $TARGET
rm -rf temp1 temp2

grep "[^a-zA-Z]ItemType_" $ITEM_FILE |sed -e's/,/--/g'|sed -e's/^\s*//g'  >> $TARGET
cat $TARGET

FIELD_FILE="../../protocol/RelationFieldsDef.h"

alias grep='grep --color'
grep "UserVar_" $FIELD_FILE|sed -e'/_MaxNum/d'|sed -e's/\/\//--/g'|sed -e's/,//g' > field.lua
grep "CorpVar_" $FIELD_FILE|sed -e'/_MaxNum/d'|sed -e's/\/\//--/g'|sed -e's/,//g' >> field.lua
grep "ArmyVar_" $FIELD_FILE|sed -e'/_MaxNum/d'|sed -e's/\/\//--/g'|sed -e's/,//g' >> field.lua
grep "CountryVar_" $FIELD_FILE|sed -e'/_MaxNum/d'|sed -e's/\/\//--/g'|sed -e's/,//g' >> field.lua
cat field.lua
