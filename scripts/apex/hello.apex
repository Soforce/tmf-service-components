// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// string tempvar = 'Enter_your_name_here';
// System.debug('Hello World!');
// System.debug('My name is ' + tempvar);

public class DataObj {
    public String name;
    public Object value;
}

DataObj dobj = new DataObj();
dobj.name = 'Age';
dobj.value = 57;

System.debug(JSON.serialize(dobj, true));

String jdata = '{"value":57,"name":"Age"}';
Object myObj = (DataObj)JSON.deserialize(jdata, DataObj.class);