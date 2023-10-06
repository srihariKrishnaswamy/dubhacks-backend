import mysql from 'mysql2'
import dotenv from 'dotenv'
import asyncHandler from 'express-async-handler'
dotenv.config()


const pool = mysql.createPool({
    host: "us-cdbr-east-06.cleardb.net",
    user: "b20faf36a67e9d",
    password: "08436b24",
    database: "heroku_6d605fac4ae93ca"
}).promise()

export const createEmployee = asyncHandler(async (req, res) => {
    const {full_name, passcode, email, gender, job_title, years_with_comp, date_joined} = req.body
    // missing employer_id
    const [result] = await pool.query(`
    INSERT INTO employee (full_name, passcode, email, gender, job_title, years_with_comp, date_joined)
    VALUES (?, ?, ?, ?, ?, ?, ?, NOW())
    `, [full_name, passcode, email, gender, job_title, years_with_comp, date_joined])
    const id = result.insertId
    const [rows] = await pool.query(`
    SELECT *
    FROM entry
    WHERE entry_id = ?
    `, [id])
    res.status(200).json(rows[0])
})