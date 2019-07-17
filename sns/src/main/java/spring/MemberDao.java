package spring;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;


import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

public class MemberDao {
		private JdbcTemplate jdbcTemplate;
		public MemberDao(DataSource dataSource) {
			this.jdbcTemplate = new JdbcTemplate(dataSource);
		}
		
		
		
		public Member selectByEmail(String email) {
			//TODO
			List<Member> result = jdbcTemplate.query(
					"select * from MEMBER where EMAIL=?", 
					new MemberRowMapper(),
					email);
			return result.isEmpty() ? null : result.get(0);
		}
public List<Member> selectAll(){
	List<Member> results = jdbcTemplate.query(
			"select * from MEMBER",
			new MemberRowMapper());
				return results;
	
}
public int count() {
	Integer count = jdbcTemplate.queryForObject("select count (*) from MEMBER", Integer.class);
	return count;
}
public void update (Member member) {
	jdbcTemplate.update(
			"update MEMBER set NAME = ?, PASSWORD = ? where EMAIL = ?",
			member.getName(),member.getPassword(),member.getEmail());
}
public void insert(final Member member) {
	KeyHolder keyHolder = new GeneratedKeyHolder();
	jdbcTemplate.update(new PreparedStatementCreator(){
		@Override
		public PreparedStatement createPreparedStatement(Connection con)throws SQLException{
		//파라미터로 전달받은 Connection을 이용해 PreparedStatement 생성
		PreparedStatement pstmt = con.prepareStatement(
		"insert into MEMBER(ID, EMAIL, PASSWORD, NAME, REGDATE)"+
		"values(MEMBER_SEQ.nextval,?,?,?,?)",
		new String[] {"ID"});
		//인덱스 파라미터 값 설정
		pstmt.setString(1, member.getEmail());
		pstmt.setString(2, member.getPassword());
		pstmt.setString(3, member.getName());
		pstmt.setTimestamp(4, new Timestamp(member.getRegisterDate().getTime())
				);
		//생성한  preparedStatement 객체 반환
		return pstmt;
		}
	}, keyHolder);
	Number keyValue = keyHolder.getKey();
	member.setId(keyValue.longValue());
	}
}		