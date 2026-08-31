# vehicle_repair_service

A new Flutter project.

## Getting Started
## Unit Testing Auth Repository

======================================
00:03 +0: AuthRepository Register register API should show result                                                                        

 ========== REGISTER RESULT ==========

{
  "status": true,
  "msg": "User register Successfully !!!",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgxNzM3OTksImV4cCI6MTc4ODE3NDk5OX0.CTdfxt9CFSw_VAa0WAMsUjJi5Os0PAIJIF3t0KqJXy4",
  "result": {
    "id": 25,
    "name": "Abhinav Jadhav",
    "phone": "9887675778",
    "photo": "",
    "role": "user",
    "created_at": "2026-08-31T10:56:39.035Z"
  }
}
00:04 +1: AuthRepository Login login API should show result                                                                              

 ========== LOGIN RESULT ==========

{
  "status": true,
  "msg": "Login Successfully !!!",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgxNzM3OTksImV4cCI6MTc4ODE3NDk5OX0.CTdfxt9CFSw_VAa0WAMsUjJi5Os0PAIJIF3t0KqJXy4",
  "result": {
    "id": 25,
    "name": "Abhinav Jadhav",
    "phone": "9887675778",
    "photo": "",
    "role": "user",
    "created_at": "2026-08-31T10:56:39.035Z"
  }
}
00:04 +2: AuthRepository Fetch Profile fetchProfile API should show result                                                               
========== FETCH PROFILE RESULT ==========
{
  "status": true,
  "msg": "Fetch User Successfully",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgxNzM4MDAsImV4cCI6MTc4ODE3NTAwMH0.Cv0dve2aV3EU97LlMxxvUbWtQzMBuEXAGikgR6VE2c8",
  "result": {
    "id": 25,
    "name": "Abhinav Jadhav",
    "phone": "9887675778",
    "photo": "",
    "role": "user",
    "created_at": "2026-08-31T10:56:39.035Z"
  }
}
00:06 +3: AuthRepository Update Profile updateProfile API should show result                                                             

 ========== UPDATE PROFILE RESULT ========== 

Instance of 'Right<Failure, Success>'
{
  "status": true,
  "msg": "Update Profile Successfully !!!",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgxNzM4MDEsImV4cCI6MTc4ODE3NTAwMX0.gX92lVoR1SVlQ9iok-W17Go3CnVruJIp7zShqLPU4JQ",
  "result": {
    "id": 25,
    "name": "Sunil Shedge",
    "phone": "9887675759",
    "photo": "",
    "role": "user",
    "created_at": "2026-08-31T10:56:39.035Z"
  }
}
00:06 +4: All tests passed!                                                                                                              
(base) sunilshedge@sunils-MacBook-Pro vehiclerepairservice % flutter test test/auth_repository_test.dart
00:01 +0: (setUpAll)                                                                                                                     
======================================
BASE URL: https://vehicle-repair-service.vercel.app
======================================
00:05 +0: AuthRepository Register register API should show result                                                                        

 ========== REGISTER RESULT ==========

{
  "status": true,
  "msg": "User register Successfully !!!",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgxNzUwOTcsImV4cCI6MTc4ODE3NjI5N30.NbGs16U1BZqRXs2VrX4lKv4O1xBFevJ2DXUyW0iL35U",
  "result": {
    "id": 26,
    "name": "Abhinav Jadhav",
    "phone": "9887675778",
    "photo": "",
    "role": "user",
    "created_at": "2026-08-31T11:18:17.589Z"
  }
}
00:06 +1: AuthRepository Login login API should show result                                                                              

 ========== LOGIN RESULT ==========

{
  "status": true,
  "msg": "Login Successfully !!!",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgxNzUwOTgsImV4cCI6MTc4ODE3NjI5OH0.hNgG5g5_K2lJj9e34ImVqcYYN5REDFuPXY5TI7iYaU8",
  "result": {
    "id": 26,
    "name": "Abhinav Jadhav",
    "phone": "9887675778",
    "photo": "",
    "role": "user",
    "created_at": "2026-08-31T11:18:17.589Z"
  }
}
00:07 +2: AuthRepository Fetch Profile fetchProfile API should show result                                                               
========== FETCH PROFILE RESULT ==========
{
  "status": true,
  "msg": "Fetch User Successfully",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgxNzUwOTksImV4cCI6MTc4ODE3NjI5OX0.GRnlp4QKUqcsHq51UIARFbm_nePGnho_4EyhSKLjqOw",
  "result": {
    "id": 26,
    "name": "Abhinav Jadhav",
    "phone": "9887675778",
    "photo": "",
    "role": "user",
    "created_at": "2026-08-31T11:18:17.589Z"
  }
}
00:08 +3: AuthRepository Update Profile updateProfile API should show result                                                             

 ========== UPDATE PROFILE RESULT ========== 

{
  "status": true,
  "msg": "Update Profile Successfully !!!",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgxNzUxMDAsImV4cCI6MTc4ODE3NjMwMH0.rfWr-uQmCrpUat_LMeT_j02-trynJeVSNvyi3oeIRZA",
  "result": {
    "id": 26,
    "name": "Sunil Shedge",
    "phone": "9887675759",
    "photo": "",
    "role": "user",
    "created_at": "2026-08-31T11:18:17.589Z"
  }
}
00:08 +4: All tests passed!                                                                                                              
(base) sunilshedge@sunils-MacBook-Pro vehiclerepairservice % flutter test test/auth_repository_test.dart
00:01 +0: (setUpAll)                                                                                                                     
======================================
BASE URL: https://vehicle-repair-service.vercel.app
======================================
00:03 +0: AuthRepository Register register API should show result                                                                        

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
00:04 +1: AuthRepository Login login API should show result                                                                              

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
00:05 +2: AuthRepository Fetch Profile fetchProfile API should show result                                                               
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
00:06 +3: AuthRepository Update Profile updateProfile API should show result                                                             

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
00:06 +4: All tests passed! 
