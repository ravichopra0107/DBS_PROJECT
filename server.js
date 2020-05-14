const express=require("express");
var mysql=require("mysql");
var path = require('path');
const app=express();
const bodyParser=require("body-parser");
app.use(bodyParser.urlencoded({extended:true}));

app.use(express.static(path.join(__dirname, 'public')));
const port=process.env.PORT||3000;
app.listen(port,function(){
    console.log("Server is running on port 3000");
});

app.get("/",function(req,res){
    res.sendFile(__dirname+"/index.html");
})
app.get('/', function(req, res){
    res.redirect(__dirname+'/index.html');
 });
 
app.get("/doctor",function(req,res){
    res.sendFile(__dirname+"/doctor.html");
})

app.get("/patient",function(req,res){
    res.sendFile(__dirname+"/patient.html");
})

app.get("/boardMember",function(req,res){
    res.sendFile(__dirname+"/boardMember.html");
})

app.get("/nurse",function(req,res){
    res.sendFile(__dirname+"/nurse.html");
})

app.get("/other",function(req,res){
    res.sendFile(__dirname+"/other.html");
})


var db = mysql.createPool({
    host     : 'us-cdbr-east-06.cleardb.net',
    user     : 'bc5d8cf43c92cf',
    password : '0946f108',
    database : 'heroku_feef2d79c35e0b1'
});

// db.connect(function(err) {
//     if (err) throw err;
//     console.log("Connected to database");
// });

app.post("/doctor/q_result",function(req,res){
    if(req.body.query=="Patients")
    {
        db.query("SELECT Name, Age, Gender, PATIENT.Prescription_number, COVID"+
        " FROM PATIENT,TREATS"+
        " WHERE TREATS.Doctor_ID="+ req.body.ID +" AND PATIENT.Prescription_number=TREATS.Prescription_number", function (err, result, fields) {
          if (err) throw err;
          res.send(result);
        });
    }
    else if(req.body.query=="Nurses"){
        db.query("SELECT Name, (YEAR(CURDATE())-year_of_joining) AS Work_Experience "+
        "FROM NURSE_DETAILS, SUPERVISES "+
        "WHERE SUPERVISES.Doctor_ID="+ req.body.ID +
        " AND SUPERVISES.Nurse_ID=NURSE_DETAILS.Nurse_ID;",function(err,result,fields){
            if(err) throw err;
            res.send(result);
        });
    }
    else if(req.body.query=="Department"){
        db.query("SELECT Location AS Floor_Number "+
        "FROM DEPARTMENT, BELONGS_TO "+
        "WHERE BELONGS_TO.Doctor_ID="+req.body.ID+
        " AND DEPARTMENT.Department_name=BELONGS_TO.Department_name;",function(err,result){
            if(err) throw err;
            res.send(result);  
        });
    }
    else if(req.body.query=="HOD"){
        db.query("SELECT Name FROM DOCTOR_DETAILS,BELONGS_TO, HEADS "+
        "WHERE BELONGS_TO.Doctor_ID="+req.body.ID+
        " AND BELONGS_TO.Department_name=HEADS.Department_name "+
        "AND DOCTOR_DETAILS.Doctor_ID=HEADS.HOD_ID;",function(err,result){
            if(err) throw err;
            res.send(result);
        });
    }
})

app.post("/boardMember/q_result",function(req,res){
    if(req.body.query=="Team Members"){
        db.query("SELECT Member_ID FROM BOARD_OF_MEMBERS WHERE Teams='"+req.body.teams+"';",function(err,result){
            if(err) throw err;
            res.send(result);
        });
    }
    else if(req.body.query=="HODs"){
        db.query("SELECT Department_name, Name FROM HEADS, DOCTOR_DETAILS WHERE HEADS.HOD_ID=DOCTOR_DETAILS.Doctor_ID;",function(err,result){
            if(err) throw err;
            res.send(result);
        });
    }
    else if(req.body.query=="Doctors"){
        db.query("SELECT * "+
        "FROM (DOCTOR_DETAILS INNER JOIN DOCTOR_PAY ON DOCTOR_DETAILS.Doctor_ID = DOCTOR_PAY.DOCTOR_ID) "+
        "INNER JOIN BELONGS_TO ON BELONGS_TO.Doctor_ID=DOCTOR_DETAILS.Doctor_ID;",function(err,result){
            if(err) throw err;
            res.send(result);
        });
    }
})

app.post("/nurse/q_result",function(req,res){
    if(req.body.query=="Patients"){
    db.query("SELECT Name, PATIENT.Prescription_number, Age "+
    "FROM PATIENT, NURSING "+
    "WHERE NURSING.Nurse_ID="+req.body.ID+
    " AND PATIENT.Prescription_number=NURSING.Prescription_number;",function(err,result){
        if(err) throw err;
        res.send(result);
    })}
    else if(req.body.query=="Doctor"){
        db.query("SELECT Name, Department_name, OPD_Timings "+
        "FROM DOCTOR_DETAILS, DOCTOR_PAY, BELONGS_TO, SUPERVISES "+
        "WHERE SUPERVISES.Nurse_ID="+req.body.ID+
        " AND DOCTOR_DETAILS.Doctor_ID=SUPERVISES.Doctor_ID "+
        "AND BELONGS_TO.Doctor_ID=SUPERVISES.Doctor_ID "+
        " AND DOCTOR_PAY.DOCTOR_ID=SUPERVISES.Doctor_ID;",function(err,result){
            if(err) throw err;
            res.send(result);
        })
    }
})

app.post("/patient/q_result",function(req,res){
    if(req.body.query=="Doctor"){
        db.query("SELECT Name, OPD_TIMINGS "+
        "FROM DOCTOR_DETAILS, DOCTOR_PAY, TREATS "+
        "WHERE TREATS.Prescription_number="+req.body.pNo+
        " AND TREATS.Doctor_ID=DOCTOR_DETAILS.Doctor_ID "+
        "AND DOCTOR_PAY.DOCTOR_ID=DOCTOR_DETAILS.Doctor_ID;",function(err,result){
            if(err) throw err;
            res.send(result);
        })
    }
    else if(req.body.query=="Department Location"){
        db.query("SELECT Location FROM DEPARTMENT, TREATS, BELONGS_TO "+
        "WHERE TREATS.Prescription_number="+req.body.pNo+
        " AND TREATS.Doctor_ID=BELONGS_TO.Doctor_ID "+
        "AND BELONGS_TO.Department_name=DEPARTMENT.Department_name;",function(err,result){
            if(err) throw err;
            res.send(result);
        })
    }
})

app.post("/other/q_result",function(req,res){
    if(req.body.query=="Ages of Doctors"){
        db.query("SELECT YEAR(CURDATE())-YEAR(DOB) AS Age, Name FROM DOCTOR_DETAILS;",function(err,result){
            if(err) throw err;
            res.send(result);
        })
    }
    else if(req.body.query=="Ages of Nurses"){
        db.query("SELECT YEAR(CURDATE())-YEAR(DOB) AS Age, Name FROM NURSE_DETAILS;",function(err,result){
            if(err) throw err;
            res.send(result);
        })
    }
    else if(req.body.query=="Number of Doctors"){
        db.query("SELECT COUNT(*) FROM DOCTOR_DETAILS;",function(err,result){
            if(err) throw err;
            res.send(result);
        })
    }
    else if(req.body.query=="Number of Nurses"){
        db.query("SELECT COUNT(*) FROM NURSE_DETAILS;",function(err,result){
            if(err) throw err;
            res.send(result);
        })
    }
    else if(req.body.query=="Number of Patients"){
        db.query("SELECT COUNT(*) FROM PATIENT;",function(err,result){
            if(err) throw err;
            res.send(result);
        })
    }
    else if(req.body.query=="COVID-19 Patients"){
        db.query("SELECT * FROM PATIENT WHERE COVID='Y';",function(err,result){
            if(err) throw err;
            res.send(result);
        })
    }
    else if(req.body.query=="COVID-19 Patients state-wise"){
        db.query("SELECT CASE "+
        "WHEN LOWER(Address) LIKE '%punjab%' THEN 'Punjab' "+
        "WHEN LOWER(Address) LIKE '%uttar%' THEN 'Uttar Pradesh' "+
        "WHEN LOWER(Address) LIKE '%haryana%' THEN 'Haryana' "+
        "WHEN LOWER(Address) LIKE '%madhya%' THEN 'Madhya Pradesh' "+
        "END AS State , COUNT(*) FROM PATIENT WHERE COVID='Y' GROUP BY State;",function(err,result){
            if(err) throw err;
            res.send(result);
        })
    }
    else if(req.body.query=="Doctors treating COVID Patients"){
        db.query("SELECT * FROM DOCTOR_DETAILS, BELONGS_TO "+
        "WHERE BELONGS_TO.Department_name='ENT' "+
        "AND BELONGS_TO.Doctor_ID=DOCTOR_DETAILS.Doctor_ID;",function(err,result){
            if(err) throw err;
            res.send(result);
        })
    }
})
// "body-parser": "^1.19.0",
    // "express": "^4.17.1",
    // "mysql": "^2.18.1"

