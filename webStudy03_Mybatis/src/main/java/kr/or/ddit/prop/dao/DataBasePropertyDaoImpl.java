package kr.or.ddit.prop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.db.ConnectionFactory;
import kr.or.ddit.vo.DataBasePropertyVO;

public class DataBasePropertyDaoImpl implements DataBasePropertyDAO {
 
	@Override
	public List<DataBasePropertyVO> selectDataBasePropertyList(DataBasePropertyVO param) {
		StringBuffer sql = new StringBuffer();
		sql.append("select property_name , property_value, description " );
		sql.append("from DATABASE_PROPERTIES  ");

		if(param!=null) {
			
			StringBuffer searchSql = new StringBuffer();
			
			if(StringUtils.isNotBlank(param.getProperty_name())) {
				searchSql.append(" OR INSTR(PROPERTY_NAME ,? )>0 ");
			}
			if(StringUtils.isNotBlank(param.getProperty_value())) {
				searchSql.append(" OR INSTR(PROPERTY_VALUE ,? )>0 ");
			}
			if(StringUtils.isNotBlank(param.getDescription())) {
				searchSql.append(" OR INSTR(description ,? )>0 ");
			
			}
			
			int index = -1 ;
			if((index = searchSql.indexOf("OR"))!=-1) {
				searchSql.delete(index, index+2); 
				sql.append(" WHERE ");
			}
			
			sql.append(searchSql.toString());
		}
		System.out.println(sql);
		
		try(
				Connection conn = ConnectionFactory.getConnection(); //conn이 닫히면 resultset도 자동으로 닫힘
//			4. 쿼리 객체 생성 
				PreparedStatement stmt= conn.prepareStatement(sql.toString());
				
				){
			if(param!=null) {
				int idx = 1 ;
				if(StringUtils.isNotBlank(param.getProperty_name()))
					stmt.setString(idx++, param.getProperty_name());
				if(StringUtils.isNotBlank(param.getProperty_value()))
					stmt.setString(idx++, param.getProperty_value());
				if(StringUtils.isNotBlank(param.getDescription()))
					stmt.setNString(idx++, param.getDescription());
				
			}
		/* 	5. 쿼리 실행  */
				ResultSet rs = 	stmt.executeQuery();
			//set == > 순서가 없음 
			List<DataBasePropertyVO> propList =new ArrayList<>();
			
			while(rs.next()){
			 	DataBasePropertyVO vo = new DataBasePropertyVO();
				vo.setProperty_name(rs.getString("property_name"));
				vo.setProperty_value(rs.getString("property_value"));
				vo.setDescription(rs.getString("description"));
				propList.add(vo);
			
			
				}
			rs.close();
			return propList;
			}catch(SQLException e ) {
				throw new RuntimeException(e);
			}
	}

	@Override
	public List<DataBasePropertyVO> searchDataBasePropertyList(String input) {
		
		StringBuffer sql = new StringBuffer();
		sql.append("select * from DATABASE_PROPERTIES ");
		sql.append("where property_name like '%' || ? || '%' ") ;
		sql.append(	"or property_value like '%' || ? || '%' or description like '%' || ? || '%' ");
		
		try(
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement  pstmt = conn.prepareStatement(sql.toString());

				) {
			pstmt.setString(1, input);
			pstmt.setString(2, input);
			pstmt.setString(3, input);
			
			ResultSet rs = pstmt.executeQuery();
			List<DataBasePropertyVO> propList = new ArrayList<>();
			while(rs.next()) {
				DataBasePropertyVO vo = new DataBasePropertyVO();
				vo.setProperty_name(rs.getString("property_name"));
				vo.setProperty_value(rs.getString("property_value"));
				vo.setDescription(rs.getString("description"));
				propList.add(vo);
			}
			
			rs.close();
			pstmt.close();
			return propList;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
		
		 
	}

	
	
	
	
	
	
	
	
}
