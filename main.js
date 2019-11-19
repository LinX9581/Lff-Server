var express = require('express')
var app = express();
var bodyParser = require('body-parser')
const mysql = require('mysql')
var multer = require("multer"); 
const path = require("path");
const fs = require("fs");
const uuidv4 = require('uuid/v4');


const conn = mysql.createConnection({
    host: 'localhost',
    user: 'Bill',
    port: '8889',
    password: 'react95818',
    database: 'react_project',
    dateStrings: true,
})

conn.connect();
app.use(express.static("./uploads"));
app.use(bodyParser.json());


const storage = multer.diskStorage({   destination: "./uploads/",   filename: function (req, file, cb) {     
        console.log("file " + JSON.stringify(file))
        cb(null, file.originalname);             
    },
});



function checkFileType(file, cb) {
    const filetypes = /jpeg|jpg|png|gif/; 
    const extname = filetypes.test(path.extname(file.originalname).toLowerCase());   
    const mimetype = filetypes.test(file.mimetype); 

    if (mimetype && extname) {
        return cb(null, true);  
    } else {
        return cb(new Error('I don\'t have a clue!'))
    }
}


const upload = multer({
    storage: storage,
    limits: { fileSize: 10000000 }, 
    fileFilter: function (req, file, cb) {  
        checkFileType(file, cb);
    },
}).single("myImage");





app.post('/api_signup', (req, res) => {
    try {

        var query_string = "INSERT INTO `member`(`account`, `password`) VALUES ( ? , ?)"
        var inserts = [req.body.account, req.body.password];
        sql = mysql.format(query_string, inserts);
        conn.query(sql, function (error, row) {
            if (error) {
                console.log(error);
                return;
            }
        })
    }
    catch (err) {
        console.log(err);
    }
    res.send({ 'success': true, 'message': 'registration success' });
})

app.post('/api_login', (req, res) => {
    try {
        var query_string = "SELECT * FROM member WHERE account = ? AND password = ?"
        var inserts = [req.body.account, req.body.password];
        sql = mysql.format(query_string, inserts);

        conn.query(sql, function (error, row, field) {

            if (error) {
                console.log(error);
                return;
            }

            if (row.length > 0) {
                res.send({ 'success': true, 'message': row[0].account });
                console.log("---" + row[0].password);

            }
            else {
                res.send({ 'success': false, 'message': 'User not found. please try again' });

            }
        })
    }
    catch (err) {
        console.log(err);
    }

})


app.post('/api_create_achievement', (req, res) => {


    try {
        var theme = req.body.theme;
        var location = req.body.location;
        var time = req.body.time;
        var content = req.body.content;
        var category = req.body.category;
        var condition = req.body.condition

        var query_string = "INSERT INTO `achievement`(`title`, `location`, `date`, `content`, `category`, `achieve_condition`) VALUES ( ? , ? , ? , ?, ?, ?)"
        var inserts = [theme, location, time, content, category, condition];
        sql = mysql.format(query_string, inserts);

        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            res.send({ 'success': true });

        })
    }
    catch (err) {
        console.log(err);
    }

})



app.post('/api_achievement_list_undertake', (req, res) => {

    try {

        var user = req.body.user;
        var category = req.body.category;
        var inserts = [user, category];
        var query_string = "SELECT achievement.*, IFNULL(achievement_task.status,'undertake') as status FROM achievement LEFT JOIN achievement_task on achievement.activity_id = achievement_task.activity_id AND achievement_task.user_id= ? WHERE achievement_task.activity_id IS NULL  AND achievement.category = ? " 
        var obj = []
        sql = mysql.format(query_string, inserts);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }

            if (row.length > 0) {

                for (var i in row) {
                    obj.push({
                        'activity_id': row[i].activity_id, 'title': row[i].title, 'location': row[i].location,
                        'date': row[i].date, 'content': row[i].content, 'category': row[i].category,
                        'condition': row[i].achieve_condition, 'image': row[i].image
                    })
                }
            }
            res.send({ 'message': obj });
        })
    }
    catch (err) {
        console.log(err);
    }

})



app.post('/api_achievement_list_processing', (req, res) => { //正在進行中的成就

    try {

        var user = req.body.user;
        var category = req.body.category;
        var inserts = [user, category];
        var query_string = "SELECT achievement.* FROM achievement INNER JOIN achievement_task on achievement.activity_id = achievement_task.activity_id WHERE achievement_task.user_id= ? AND achievement_task.status='processing' AND achievement.category = ? "
        sql = mysql.format(query_string, inserts);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            var obj = []
            if (row.length > 0) {

                for (var i in row) {
                    obj.push({
                        'activity_id': row[i].activity_id, 'title': row[i].title, 'location': row[i].location,
                        'date': row[i].date, 'content': row[i].content, 'category': row[i].category,
                        'condition': row[i].achieve_condition, 'image': row[i].image
                    })

                }
            }
            res.send({ 'message': obj });
        })
    }
    catch (err) {
        console.log(err);
    }

})



app.post('/api_achievement_list_complete', (req, res) => {

    try {

        var user = req.body.user;
        var category = req.body.category;
        var inserts = [user, category];
        var query_string = "SELECT achievement.* FROM achievement INNER JOIN achievement_task on achievement.activity_id = achievement_task.activity_id WHERE achievement_task.user_id= ? AND achievement_task.status='complete' AND achievement.category = ? "
        sql = mysql.format(query_string, inserts);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            var obj = []
            if (row.length > 0) {
                for (var i in row) {
                    obj.push({
                        'activity_id': row[i].activity_id, 'title': row[i].title, 'location': row[i].location,
                        'date': row[i].date, 'content': row[i].content, 'category': row[i].category,
                        'condition': row[i].achieve_condition, 'image': row[i].image
                    })

                }
            }
            res.send({ 'message': obj });
        })
    }
    catch (err) {
        console.log(err);
    }

})


app.post('/api_create_post', (req, res) => {

    try {
        var activity_id = req.body.activity_id;
        var user_id = req.body.user;
        var title = req.body.title;
        var date = req.body.date;
        var content = req.body.content;

        var query_string = "INSERT INTO `post`(`activity_id`,`user_id`, `title`, `date`, `content`, `image_uri`) VALUES (? ,?, ?, ?, ?, ?)" 
        var uri = user_id + '/' + activity_id + '_' + user_id + '.jpg'
        var inserts = [activity_id, user_id, title, date, content, uri];
        sql = mysql.format(query_string, inserts);

        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            query_string = "INSERT INTO `achievement_task`(`activity_id`,`user_id`, `status`) VALUES (? ,?, 'processing')" 
            inserts = [activity_id, user_id];
            sql = mysql.format(query_string, inserts);
            conn.query(sql, function (error, row, field) {
                if (error) {
                    console.log(error);
                    return;
                }

                res.send({ 'success': true });
            })
        })
    }
    catch (err) {
        console.log(err);
    }
})





app.post('/api_check_task_status', (req, res) => {

    try {
        var user = req.body.user;
        var query_string = "SELECT post.post_id, post.activity_id, COUNT(statistic_praise.praise) as praise FROM post LEFT JOIN statistic_praise ON post.post_id = statistic_praise.post_id WHERE post.user_id= ? GROUP BY(post.post_id) HAVING praise>=5"
        var inserts = [user];
        var eligible = []; //儲存這個使用者已符合完成資格的任務
        sql = mysql.format(query_string, inserts);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            if (row.length > 0) {
                for (var i in row) {
                    eligible.push(row[i].activity_id)
                }
            }
            query_string = "SELECT activity_id FROM `achievement_task` WHERE user_id= ?  AND status = 'processing' " // 所有這個使用者進行中的成就
            sql = mysql.format(query_string, inserts);
            conn.query(sql, function (error, row, field) {
                if (error) {
                    console.log(error);
                    return;
                }
                if (row.length > 0) {

                    for (let i in row) {
                  
                        if (eligible.indexOf(row[i].activity_id) != -1) { 
                            var update_string = "UPDATE `achievement_task` SET `status`='complete' WHERE activity_id =" + row[i].activity_id
                            sql = mysql.format(update_string);
                            conn.query(sql, function (error, row, field) {
                                if (error) {
                                    console.log(error);
                                    return;
                                }
                            })
                        }
                    }
                }
                res.send({ 'success': true });
            })
        })

    }
    catch (err) {
        console.log(err);
    }

})









app.post('/api_set_achievement_compelted', (req, res) => {//新增貼文 

    try {
        var activity_id = req.body.activity_id;
        var user_id = req.body.user;

        var query_string = "INSERT INTO `achievement_task`(`activity_id`, `user_id`, `status`) VALUES ( ?, ?, 'complete')"    
        var inserts = [activity_id, user_id];
        sql = mysql.format(query_string, inserts);

        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            res.send({ 'success': true });
        })
    }
    catch (err) {
        console.log(err);
    }
})








app.post('/api_get_post', (req, res) => {

    var result = []
    try {
        var user_id = req.body.user;
        var pressed_which = "SELECT post_id FROM statistic_praise WHERE giver = ? "
        var inserts = [user_id]
        sql = mysql.format(pressed_which, inserts);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            if (row.length > 0) {
                for (var i in row) {
                    result.push(row[i].post_id)                               
                }
            }
            var query_string = "SELECT post.post_id, post.user_id, post.title, post.content, COUNT(statistic_praise.praise) as praise FROM post LEFT JOIN statistic_praise ON post.post_id = statistic_praise.post_id GROUP BY(post.post_id)"

            sql = mysql.format(query_string);
            conn.query(sql, function (error, row, field) {
                if (error) {
                    console.log(error);
                    return;
                }

                if (row.length > 0) {
                    var obj = []
                    for (var i in row) {
                        obj.push({ 'post_id': row[i].post_id, 'user_id': row[i].user_id, 'title': row[i].title, 'content': row[i].content, 'praise': row[i].praise, 'flag': false })
                    }
                    console.log(typeof (result[0]))
                    res.send({ 'message': obj, 'pressed_which': result });
                }
            })

        })

    }
    catch (err) {
        console.log(err);
    }

})


app.post('/api_get_personal_post', (req, res) => {

    var result = []
    try {
        var user_id = req.body.user;
        var pressed_which = "SELECT post.post_id FROM statistic_praise INNER JOIN post ON post.post_id=statistic_praise.post_id WHERE post.user_id = ? and statistic_praise.giver = ? " //使用者點過哪幾篇文章讚
        var inserts = [user_id, user_id]
        sql = mysql.format(pressed_which, inserts);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            if (row.length > 0) {
                for (var i in row) {
                    result.push(row[i].post_id)                              
                }
            }
            var query_string = "SELECT post.*, COUNT(statistic_praise.praise) as praise FROM post LEFT JOIN statistic_praise ON post.post_id = statistic_praise.post_id WHERE post.user_id= ? GROUP BY(post.post_id)"
            inserts = [user_id]
            sql = mysql.format(query_string, inserts);
            conn.query(sql, function (error, row, field) {
                if (error) {
                    console.log(error);
                    return;
                }
                var obj = []
                for (var i in row) {
                    obj.push({ 'activity_id': row[i].activity_id, 'post_id': row[i].post_id, 'user_id': row[i].user_id, 'title': row[i].title, 'content': row[i].content, 'image_uri': row[i].image_uri, 'praise': row[i].praise, 'date': row[i].date, 'flag': false })
                }
                res.send({ 'message': obj, 'pressed_which': result });
            })
        })
    }
    catch (err) {
        console.log(err);
    }

})





app.post('/api_get_random_post', (req, res) => {


    try {
        var user_id = req.body.user;
        var query_string = "SELECT post_id FROM statistic_praise WHERE giver = ? "  //看使用者按過哪幾篇文章讚
        var inserts = user_id;
        var clicked = [];
        var obj = [];
        sql = mysql.format(query_string, inserts);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }

            for (var i in row) {
                clicked.push(row[i].post_id);
            }

            // 隨機抓20筆非這個使用者的貼文     
            query_string = "SELECT member.head_sticker, post.* FROM post INNER JOIN member on post.user_id = member.account WHERE post.user_id!= ? ORDER BY RAND() LIMIT 20 "
            sql = mysql.format(query_string, inserts);
            conn.query(sql, function (error, row, field) {
                if (error) {
                    console.log(error);
                    return;
                }
                if (row.length == 0) {                  
                    res.send({ 'obj': obj, 'clicked': clicked })
                }
                for (let i in row) {
                    obj.push(row[i])
                    query_string = "SELECT post.*, COUNT(statistic_praise.praise) as praise FROM post LEFT JOIN statistic_praise ON post.post_id = statistic_praise.post_id WHERE post.post_id= ? GROUP BY(post.post_id)"
                    inserts = [row[i].post_id];
                    sql = mysql.format(query_string, inserts);
                    conn.query(sql, function (error, row2, field) {
                        for (let j in row2) {
                            obj[i].praise = row2[j].praise;
                        }

                        if (i == row.length - 1) { 
                            res.send({ 'obj': obj, 'clicked': clicked })
                        }
                    })
                }

            })
        })

    }
    catch (err) {
        console.log(err);
    }

})



app.post('/api_get_Specific_article_in_progress', (req, res) => {

    try {
        var user_id = req.body.user;
        var activity_id = req.body.activity_id;
        var pressed = "SELECT * FROM post INNER JOIN statistic_praise ON post.post_id = statistic_praise.post_id WHERE statistic_praise.giver= ? AND  post.activity_id= ? ";//使用者有沒有按過這篇進行中的文章支持

        var inserts = [user_id, activity_id];
        sql = mysql.format(pressed, inserts);
        conn.query(sql, function (error, row, field) {
            var flag = false
            if (error) {
                console.log(error);
                return;
            }
            if (row.length > 0) {
                console.log("ok")
                flag = true;
            }

           
            var query_string = "SELECT post.post_id, post.user_id, post.title, post.content, post.image_uri, COUNT(statistic_praise.praise) as praise FROM post LEFT JOIN statistic_praise ON post.post_id = statistic_praise.post_id WHERE post.user_id= ? AND post.activity_id= ? GROUP BY(post.post_id)" //數這篇文章有幾個讚
            inserts = [user_id, activity_id];
            sql = mysql.format(query_string, inserts);
            conn.query(sql, function (error, row, field) {
                if (error) {
                    console.log(error);
                    return;
                }

                if (row.length > 0) {
                    var obj = []

                    obj.push({ 'post_id': row[0].post_id, 'user_id': row[0].user_id, 'title': row[0].title, 'content': row[0].content, 'praise': row[0].praise, 'image_uri': row[0].image_uri, 'flag': flag })
                    res.send({ 'message': obj });
                }
            })
        })

    }
    catch (err) {
        console.log(err);
    }

})



app.post('/api_set_praise', (req, res) => {

    try {
        var post_id = req.body.post_id;
        var giver = req.body.giver;
        var action = req.body.action;
        var query_string = ""
        if (action == "increase") {
            query_string = "INSERT INTO `statistic_praise`( `post_id`, `giver`, `praise`) VALUES (?, ?, 1)"
        }
        else {
            query_string = "DELETE FROM `statistic_praise` WHERE post_id = ? and giver = ?"

        }
        var inserts = [post_id, giver];
        sql = mysql.format(query_string, inserts);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            res.send({ 'success': true });
        })

    }
    catch (err) {
        console.log(err);
    }

})



app.post('/api_get_decoration', (req, res) => {

    try {

        var user = req.body.user;
        var query_string = "SELECT `activity_id` FROM `achievement_task` WHERE user_id= ? AND status='complete'"
        var inserts = [user];
        sql = mysql.format(query_string, inserts);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }

            if (row.length > 0) {
                var obj = []
                for (let i in row) { 

                    query_string = "SELECT `activity_id` , `describe_medal`, `image` FROM `medal` WHERE activity_id=" + row[i].activity_id
                    sql = mysql.format(query_string);
                    conn.query(sql, function (error, banana, field) {
                        obj.push({ 'activity_id': banana[0].activity_id, 'describe': banana[0].describe_medal }) 

                        if (i == row.length - 1) {
                            console.log("看這裡 :  " + i)
                            res.send({ 'message': obj });
                        }
                    })
                }
            }
        })
    }
    catch (err) {
        console.log(err);
    }

})




app.post("/api_uploadphoto", function (req, res) {    

    upload(req, res, err => { 
        let accountName = req.body.account;
        if (err) {
            console.log(err);
        }

        else {
            var mkdirsync = "./uploads/profile/" + accountName + "/";
            function mkdirpath(mkdirsync) {
                if (!fs.existsSync(mkdirsync)) { 
                    try {
                        fs.mkdirSync(mkdirsync);
                    } catch (e) {
                        mkdirpath(path.dirname(mkdirsync)); 
                        mkdirpath(mkdirsync);
                    }
                }
                else {
                    console.log("這個資料夾已經存在");
                    return;
                }
            }

            mkdirpath(mkdirsync);
            var sourceFile = "./uploads/" + req.file.originalname;
            var destFile = ""
            var name = uuidv4();

            if (req.body.function == "image_for_post") {
                destFile = mkdirsync + req.body.activity_id + "_" + accountName + ".jpg";
            }
            else if (req.body.function == "journal_post") {
                destFile = mkdirsync + name + ".jpg";
                var query_string = "INSERT INTO `post`(`activity_id`,`user_id`, `title`, `date`, `content`, `image_uri`) VALUES (0, ? ,?, ?, ?, ?)"; 
                var title = req.body.title;
                var date = req.body.date;
                var content = req.body.content;
                var image_uri = accountName + '/' + name + '.jpg';
                var inserts = [accountName, title, date, content, image_uri];
                sql = mysql.format(query_string, inserts);
                conn.query(sql, function (error, row, field) {
                    console.log("journal_post")
                })
            }
            else { //頭貼
                destFile = mkdirsync + accountName + ".jpg"; 
                var query_string = "UPDATE `member` SET `head_sticker`= ?  WHERE `account` =? ";
                var user_sticker = accountName + '/' + accountName + '.jpg';
                var inserts = [user_sticker, accountName];
                sql = mysql.format(query_string, inserts);
                conn.query(sql, function (error, row, field) {
                    console.log("complete")
                })
            }

            fs.rename(sourceFile, destFile, function (err) {
                if (err) console.log("ERROR: " + err);
            });

            res.send({ 'success': true });


        }
    });
});





app.post('/api_get_head_sticker', (req, res) => {

    try {

        var user = req.body.user;
        var query_string = "SELECT `head_sticker` FROM `member` WHERE account = ? "
        var inserts = [user];
        sql = mysql.format(query_string, inserts);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            if (row.length > 0) {
                res.send({ 'success': row[0].head_sticker });
            }
        })
    }
    catch (err) {
        console.log(err);
    }

})




app.post('/api_get_simulation_info', (req, res) => {

    try {

        var user = req.body.user;
        var query_string = "SELECT COUNT(activity_id) as num_of_achievement FROM achievement"
        var inserts = [user];
        var num_of_achievement;
        var num_of_complete;
        sql = mysql.format(query_string);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            if (row.length > 0) {
                num_of_achievement = row[0].num_of_achievement
            }
            query_string = "SELECT COUNT(activity_id) as num_of_complete FROM achievement_task WHERE user_id = ? AND status ='complete' "
            sql = mysql.format(query_string, user);
            conn.query(sql, function (error, row, field) {
                if (error) {
                    console.log(error);
                    return;
                }
                if (row.length > 0) {
                    num_of_complete = row[0].num_of_complete
                }
                res.send({ 'num_of_achievement': num_of_achievement, 'num_of_complete': num_of_complete });
            })

        })
    }
    catch (err) {
        console.log(err);
    }

})



app.post('/api_get_rank_info', (req, res) => {

    try {

        var query_string = "SELECT user_id ,COUNT(status) as num, IFNULL(member.head_sticker ,'default/logo.png') as head_sticker FROM `achievement_task` LEFT JOIN member on member.account = achievement_task.user_id WHERE status = 'complete' GROUP BY user_id ORDER BY (num) DESC LIMIT 0, 10"
        var obj = [];
        var obj2 = [];
        sql = mysql.format(query_string);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            for (var i in row) {
                obj.push({ 'user_id': row[i].user_id, 'num': row[i].num, 'head_sticker': row[i].head_sticker })
            }

            query_string = "SELECT post.user_id, COUNT(statistic_praise.praise) AS num FROM post LEFT JOIN statistic_praise on post.post_id = statistic_praise.post_id GROUP BY post.user_id ORDER BY `num` DESC"
            sql = mysql.format(query_string);
            conn.query(sql, function (error, row, field) {
                if (error) {
                    console.log(error);
                    return;
                }
                for (let i in row) {
                    console.log(row[i].user_id)
                    query_string = "SELECT `head_sticker` FROM `member` WHERE account = ? "
                    var inserts = [row[i].user_id];
                    sql = mysql.format(query_string, inserts);
                    conn.query(sql, function (error, row2, field) {
                        if (error) {
                            console.log(error);
                            return;
                        }
                        obj2.push({ 'user_id': row[i].user_id, 'num': row[i].num, 'head_sticker': row2[0].head_sticker })
                        if(i==row.length-1){
                            console.log(obj2)
                            res.send({ obj: obj, obj2: obj2 });

                        }
                    })
                }
            })
           
          

        })
    }
    catch (err) {
        console.log(err);
    }

})

app.post('/api_get_completion_rate', (req, res) => {

    try {
        var user = req.body.user
        var query_string = "SELECT COUNT(activity_id) as num FROM `achievement`"
        // var obj = []
        var total_number_of_achievements
        var number_of_user_completed
        sql = mysql.format(query_string);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            total_number_of_achievements = row[0].num;
            query_string = "SELECT COUNT(user_id) as num FROM `achievement_task` WHERE user_id=? AND status='complete'"
            var inserts = [user];
            sql = mysql.format(query_string, inserts);
            conn.query(sql, function (error, row, field) {
                if (error) {
                    console.log(error);
                    return;
                }
                number_of_user_completed = row[0].num
                res.send({ success: (number_of_user_completed / total_number_of_achievements * 100).toString() + '%' }); 
            })

        })

    }
    catch (err) {
        console.log(err);
    }
})



app.post('/api_get_location_info', (req, res) => {
  
    try {
        var user = req.body.user
        var query_string = "SELECT achievement.location FROM `achievement_task` INNER JOIN achievement on achievement.activity_id = achievement_task.activity_id WHERE achievement.category='旅遊類' AND achievement_task.user_id= ?"
        var inserts = [user];
        sql = mysql.format(query_string, inserts);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            res.send({ success: row });
        })
    }
    catch (err) {
        console.log(err);
    }

})



app.post('/api_confirm_this_location', (req, res) => { //確認這個地點完成了沒，如果完成替換圖片     

    try {
        var user = req.body.user;
        var location = req.body.location;
        var query_string = "SELECT achievement.activity_id FROM `achievement` INNER JOIN achievement_task ON achievement.activity_id=achievement_task.activity_id WHERE achievement_task.user_id= ? AND achievement.location= ? "
        var inserts = [user, location];
        sql = mysql.format(query_string, inserts);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            res.send({ result: row });
        })
    }
    catch (err) {
        console.log(err);
    }

})

app.post('/api_check_user_info', (req, res) => { //確認使用者個人頁面資訊 

    try {
        var user = req.body.user;
        var query_string = "SELECT COUNT(achievement_task.status) as completed FROM achievement_task WHERE user_id= ? "
        var inserts = [user];
        let completed = 0;
        let num_of_post = 0;
        let statistics_praise = 0;
        sql = mysql.format(query_string, inserts);
        conn.query(sql, function (error, row, field) {
            if (error) {
                console.log(error);
                return;
            }
            if (row.length > 0) {
                completed = row[0].completed
            }
            query_string = "SELECT COUNT(post_id) as post FROM post WHERE user_id= ?"
            sql = mysql.format(query_string, inserts);
            conn.query(sql, function (error, row, field) {
                if (error) {
                    console.log(error);
                    return;
                }
                if (row.length > 0) {
                    num_of_post = row[0].post
                }
                query_string = "SELECT post.user_id, COUNT(statistic_praise.praise) AS praise FROM post LEFT JOIN statistic_praise on post.post_id = statistic_praise.post_id WHERE user_id= ? GROUP BY post.user_id"
                sql = mysql.format(query_string, inserts);
                conn.query(sql, function (error, row, field) {
                    if (error) {
                        console.log(error);
                        return;
                    }
                    if (row.length > 0) {
                        statistics_praise = row[0].praise
                    }
                    res.send({ complted: completed, num_of_post: num_of_post, statistics_praise, statistics_praise });
                })
            })
        })
    }
    catch (err) {
        console.log(err);
    }

})



app.listen(3000, function () {
    console.log("伺服器已經啟動");
});



