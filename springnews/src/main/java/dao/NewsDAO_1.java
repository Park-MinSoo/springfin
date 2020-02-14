package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import vo.NewsVO;
@Repository
public class NewsDAO_1 {
	
	public Connection connectDB() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		try {Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "jdbctest", 
						"jdbctest");
				return conn;	
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public void close(Connection conn, Statement stmt, ResultSet rs ) {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		try {
			conn.close();
			stmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<NewsVO> listAll() {
		List<NewsVO> list = new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		try (Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "jdbctest", 
						"jdbctest");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery
				("select id, writer, title, content,  to_char(writedate, "
				+ "'rrrr-mm-dd'), cnt from news");) {
			NewsVO vo;
			while(rs.next()) {
				vo = new NewsVO();
				vo.setId(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setWritedate(rs.getString(5));
				vo.setCnt(rs.getInt(6));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean insert(NewsVO vo) {
		boolean result = true;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		try (Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "jdbctest", "jdbctest");
				PreparedStatement pstmt = conn.prepareStatement(
						"insert into news values(news_seq.nextval,?, ? ,?, to_date(sysdate, 'rrrr-mm-dd' ), 0)");){ 
						pstmt.setString(1, vo.getWriter());
						pstmt.setString(2, vo.getTitle());
						pstmt.setString(3, vo.getContent());						
						pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}

	public List<NewsVO> search(String keyword, String searchType) {
		List<NewsVO> list = new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		try (Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "jdbctest", "jdbctest");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery
				("select  id, writer, title, content,  to_char(writedate, "
						+ "'rrrr-mm-dd'), cnt from news where " + searchType + " like '%"+keyword+"%'");) {
			NewsVO vo;
			while(rs.next()) {
				vo = new NewsVO();
				vo.setId(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setWritedate(rs.getString(5));
				vo.setCnt(rs.getInt(6));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}	
	

	public List<NewsVO> listWriter(String writer) {
		List<NewsVO> list = new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		try (Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "jdbctest", 
						"jdbctest");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery
				("select id, writer, title, content,  to_char(writedate, "
				+ "'rrrr-mm-dd'), cnt from news where writer like '%"+writer+"%'");) {
			NewsVO vo;
			while(rs.next()) {
				vo = new NewsVO();
				vo.setId(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setWritedate(rs.getString(5));
				vo.setCnt(rs.getInt(6));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean delete(int id) {
		boolean result = true;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		try (Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "jdbctest", "jdbctest");
				PreparedStatement pstmt = conn.prepareStatement(
						"delete from news where id="+ id);) {
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}	

public boolean update(NewsVO vo) {
		boolean result = true;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jdbctest","jdbctest");
				PreparedStatement pstmt = conn.prepareStatement(
						"update news set writer = ?,title = ?, content = ?, id = ?, writedate = ? where id = ?");){
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getId());
			pstmt.setString(5, vo.getWritedate());
			pstmt.setInt(6, vo.getId());
			pstmt.executeUpdate();			
		}catch(SQLException e){
			result = false;
			e.printStackTrace();
		}
		
		return result;
	}

public NewsVO listOne(int id) {
	NewsVO vo;
	vo = new NewsVO();
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	} catch(Exception e) {
		System.out.println(e.getMessage());
	}
	try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jdbctest","jdbctest");
			PreparedStatement pstmt = conn.prepareStatement(
					"update news set cnt=cnt+1 where id = "+id);){	
		pstmt.executeUpdate();			
	}catch(SQLException e){
		
		e.printStackTrace();
	}	
	try (Connection conn = DriverManager.getConnection
			("jdbc:oracle:thin:@localhost:1521:xe", "jdbctest", 
					"jdbctest");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery
			("select id, writer, title, content,  to_char(writedate, "
			+ "'rrrr-mm-dd'), cnt from news where id =" + id);) {
		if(rs.next()) {
			vo.setId(rs.getInt(1));
			vo.setWriter(rs.getString(2));
			vo.setTitle(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setWritedate(rs.getString(5));
			vo.setCnt(rs.getInt(6));
		}
		else{
			return null;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return vo;
}

}


