# vehicle_repair_service

A new Flutter project.

## Unit Testing Auth Repository
                                                                                                           
sunilshedge@sunils-MacBook-Pro vehiclerepairservice % flutter test test/auth_repository_test.dart

##0: AuthRepository Register register API should show result                                                                        

 ========== REGISTER RESULT ==========

{ 
  "status": true,
  "msg": "User register Successfully !!!",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgxNzUxMjMsImV4cCI6MTc4ODE3NjMyM30.7Cih9FxSPPCfdvtzssZVtCkUh8K8BbOGH2Ob3aVE9l0",
  "result": {
    "id": 27,
    "name": "Abhinav Jadhav",
    "phone": "9887675778",
    "photo": "",
    "role": "user",
    "created_at": "2026-08-31T11:18:43.344Z"
  }
}

##1: AuthRepository Login login API should show result                                                                              

 ========== LOGIN RESULT ==========

{
  "status": true,
  "msg": "Login Successfully !!!",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgxNzUxMjQsImV4cCI6MTc4ODE3NjMyNH0.1ZiwyA7V338uVgsSMhpKNCHtdTPHHlAtbe5qljBHROY",
  "result": {
    "id": 27,
    "name": "Abhinav Jadhav",
    "phone": "9887675778",
    "photo": "",
    "role": "user",
    "created_at": "2026-08-31T11:18:43.344Z"
  }
}

##2: AuthRepository Fetch Profile fetchProfile API should show result                                                               
========== FETCH PROFILE RESULT ==========
{
  "status": true,
  "msg": "Fetch User Successfully",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgxNzUxMjUsImV4cCI6MTc4ODE3NjMyNX0._cSjPoJXIWfTRj4cOaYmRkyzkmWYYrAC6hnYmbumfpY",
  "result": {
    "id": 27,
    "name": "Abhinav Jadhav",
    "phone": "9887675778",
    "photo": "",
    "role": "user",
    "created_at": "2026-08-31T11:18:43.344Z"
  }
}

##3: AuthRepository Update Profile updateProfile API should show result                                                             

 ========== UPDATE PROFILE RESULT ========== 

{
  "status": true,
  "msg": "Update Profile Successfully !!!",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgxNzUxMjUsImV4cCI6MTc4ODE3NjMyNX0._cSjPoJXIWfTRj4cOaYmRkyzkmWYYrAC6hnYmbumfpY",
  "result": {
    "id": 27,
    "name": "Sunil Shedge",
    "phone": "9887675759",
    "photo": "",
    "role": "user",
    "created_at": "2026-08-31T11:18:43.344Z"
  }
}
##4: All tests passed! 
