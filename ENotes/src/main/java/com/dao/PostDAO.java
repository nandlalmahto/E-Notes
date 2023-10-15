package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.user.Post;

public class PostDAO {
    private Connection conn;

    public PostDAO(Connection conn) {
        this.conn = conn;
    }

    //adding the data into into post table in database
    public boolean AddNotes(String title, String content, int uid) {
        boolean f = false;

        try {
            String query = "insert into post(title, content, uid) values(?,?,?)";
            PreparedStatement ps = this.conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setInt(3, uid);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception var8) {
            var8.printStackTrace();
        }

        return f;
    }

    //getting all the data from database by using id from post table
    public List<Post> getData(int id) {
        List<Post> list = new ArrayList<Post>();
        Post po = null;

        try {
            String query = "select * from post where uid=? order by id desc";
            PreparedStatement ps = this.conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                po = new Post();
                po.setId(rs.getInt(1));
                po.setTitle(rs.getString(2));
                po.setContent(rs.getString(3));
                po.setPdate(rs.getTimestamp(4));
                list.add(po);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //selecting the data by using id from database in post table
    public Post getDataById(int noteId) {
        Post p = null;

        try {
            String query = "select * from post where id=?";
            PreparedStatement ps = this.conn.prepareStatement(query);
            ps.setInt(1, noteId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Post();
                p.setId(rs.getInt(1));
                p.setTitle(rs.getString(2));
                p.setContent(rs.getString(3));
            }
        } catch (Exception var6) {
            var6.printStackTrace();
        }

        return p;
    }

    //update the data into database in post table
    public boolean PostUpdate(int nid, String title, String content) {
        boolean f = false;

        try {
            String query = "update post set title=?, content=? where id=?";
            PreparedStatement ps = this.conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setInt(3, nid);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception var8) {
            var8.printStackTrace();
        }

        return f;
    }

    
    //delete the data from database in post table
    public boolean DeleteNotes(int id) {
        boolean f = false;

        try {
            String query = "delete from post where id=?";
            PreparedStatement ps = this.conn.prepareStatement(query);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}
