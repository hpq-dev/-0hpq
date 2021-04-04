
std::checker(const string[],pos=-1,length=-1) {
	length=strlen(string);
    while(pos<length) {if string[++pos]<'A'||string[pos]>'Z' *then continue; else break;}
    while(pos<length) {if string[++pos]<'0'||string[pos]>'9' *then continue; else return true;}
    return false;
}
std::IsMail(const string[],len=-1) {
    if((len=strlen(string))<15) return false;
    if string[len-4]!='.'||string[len-10]!='@' *then return false;
    return true;
}
std::hash_string(iteration, const _x = ']') {
	new str[32],x=-1;
	while(++x<iteration-1) str[x]=_x;
	return str;
}

std::compare(const string:string1[], const string:string2[])
	return !strcmp(string1,string2,true)?true:false;