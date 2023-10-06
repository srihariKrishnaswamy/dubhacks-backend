import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'
dotenv.config()
const PORT = 8080

const app = express()
app.use(express.json())
 
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).send("Something broke!")
})
 
app.listen(process.env.PORT || PORT, () => {
    console.log(`The server is running on port ${process.env.PORT}`)
})
