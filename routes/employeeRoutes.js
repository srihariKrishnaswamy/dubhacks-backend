import express from 'express';
import  { createEmployee } from '../controllers/employeesController.js';

const router = express.Router();

router.route('/')
    .post(createEmployee)

export default router;