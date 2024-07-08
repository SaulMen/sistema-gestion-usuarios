<?php

use App\Http\Controllers\adminAgregar;
use App\Http\Controllers\adminCargar;
use App\Http\Controllers\adminCarrera;
use App\Http\Controllers\adminCurso;
use App\Http\Controllers\adminDocente;
use App\Http\Controllers\adminHabilitar;
use App\Http\Controllers\adminHome;
use App\Http\Controllers\adminPrerrequisito;
use App\Http\Controllers\adminStudent;
use App\Http\Controllers\adminTasa;
use App\Http\Controllers\home;
use App\Http\Controllers\login;
use App\Http\Controllers\logout;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\studentHomeController;

use App\Http\Controllers\LoginController;

use App\Http\Controllers\studentAssignCourse;
use App\Http\Controllers\studentRequests;
use App\Http\Controllers\studentProfile;
use App\Http\Controllers\studentGetCurriculum;
use App\Http\Controllers\studentDeassignCourse;

use App\Http\Controllers\professorHome;
use App\Http\Controllers\professorEnterNotes;
use App\Http\Controllers\professorGenerateReport;
use App\Http\Controllers\professorProfile;
use App\Http\Controllers\professorConsultStudents;
use App\Http\Controllers\professorConsultApprovals;
use App\Http\Controllers\professorConsultReports;
use App\Http\Controllers\consultSchedules;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*-------------------------------------------------------------------------------------------------------------
                                        STUDENT
-------------------------------------------------------------------------------------------------------------*/

Route::get('/studentHome', [studentHomeController::class, 'index'])->name('student.home');
Route::get('/studentAssign', [studentAssignCourse::class, 'index'])->name('student.assign');
Route::get('/studentRequest', [studentRequests::class, 'index'])->name('student.request');
Route::get('/studentProfile', [studentProfile::class, 'index'])->name('student.profile');
Route::get('/studentGetCurriculum',[studentGetCurriculum::class, 'index'])->name('student.curriculum');
Route::get('/studentDeassign',[studentDeassignCourse::class, 'index'])->name('student.deassign');

Route::post('/studentAssign', [studentAssignCourse::class, 'postCourseAssignment'])->name('student.assignCourse');
Route::post('/studentRequest', [studentRequests::class, 'postConcurrentCareer'])->name('student.concurrent');
Route::post('/studentDeassign',[studentDeassignCourse::class, 'postCourseDeassignment'])->name('student.deassignCourse');

Route::get('/studentCurriculum',[studentGetCurriculum::class, 'getCurriculum'])->name('student.getCurriculum');
Route::get('/studentCourses',[studentDeassignCourse::class, 'getAssignedCourses'])->name('student.assignedCourses');

/*-------------------------------------------------------------------------------------------------------------
                                        PROFESSOR
-------------------------------------------------------------------------------------------------------------*/
Route::get('/professorHome',[professorHome::class, 'index'])->name('professor.home');
Route::get('/professorEnterNotes', [professorEnterNotes::class, 'index'])->name('professor.notes');
Route::get('/professorGenerateReport', [professorGenerateReport::class, 'index'])->name('professor.generate.report');
Route::get('/professorProfile', [professorProfile::class, 'index'])->name('professor.profile');
Route::get('/professorConsultStudents', [professorConsultStudents::class, 'index'])->name('professor.students');
Route::get('/professorConsultApprovals', [professorConsultApprovals::class, 'index'])->name('professor.approvals');
Route::get('/professorConsultReports', [professorConsultReports::class, 'index'])->name('professor.reports');

Route::post('/professorEnterNotes', [professorEnterNotes::class, 'postNote'])->name('professor.setStudentNote');
Route::post('/professorGenerateReport', [professorGenerateReport::class, 'postGenReport'])->name('professor.generate');
Route::get('/professorConsultStudents1', [professorConsultStudents::class, 'getStudents'])->name('professor.getStudents');

Route::get('/consultSchedules', [consultSchedules::class, 'index'])->name('consult.schedule');




/*-------------------------------------------------------------------------------------------------------------
                                        ADMIN
-------------------------------------------------------------------------------------------------------------*/
Route::get('/', [home::class, 'index'])->name('home');

Route::get('/login', [login::class, 'index'])->name('login');

Route::post('/login', [login::class, 'authenticate'])->name('login.authenticate');

Route::get('/adminHome', [adminHome::class, 'index'])->name('adminHome');
Route::post('/adminHome', [adminHome::class, 'logout'])->name('adminHome.logout');

Route::get('/adminStudent', [adminStudent::class, 'index'])->name('adminStudent');
Route::post('/adminStudent', [adminStudent::class, 'create'])->name('adminStudent.create');

Route::get('/adminDocente', [adminDocente::class, 'index'])->name('adminDocente');
Route::post('/adminDocente', [adminDocente::class, 'create'])->name('adminDocente.create');

Route::get('/adminCarrera', [adminCarrera::class, 'index'])->name('adminCarrera');
Route::post('/adminCarrera', [adminCarrera::class, 'create'])->name('adminCarrera.create');

Route::get('/adminCurso', [adminCurso::class, 'index'])->name('adminCurso');
Route::post('/adminCurso', [adminCurso::class, 'create'])->name('adminCurso.create');

Route::get('/adminHabilitar', [adminHabilitar::class, 'index'])->name('adminHabilitar');
Route::post('/adminHabilitar', [adminHabilitar::class, 'create'])->name('adminHabilitar.create');

Route::get('/adminAgregar', [adminAgregar::class, 'index'])->name('adminAgregar');

Route::get('/adminCargar', [adminCargar::class, 'index'])->name('adminCargar');
Route::post('/adminCargar', [adminCargar::class, 'create'])->name('adminCargar.create');

Route::get('/adminTasa', [adminTasa::class, 'index'])->name('adminTasa');

Route::get('/adminPrerrequisito', [adminPrerrequisito::class, 'index'])->name('adminPrerrequisito');
Route::post('/adminPrerrequisito', [adminPrerrequisito::class, 'create'])->name('adminPrerrequisito.create');

