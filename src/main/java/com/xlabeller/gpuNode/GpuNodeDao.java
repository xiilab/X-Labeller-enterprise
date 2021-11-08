package com.xlabeller.gpuNode;

import com.xlabeller.common.module.CmdExector;
import com.xlabeller.models.GpuNodeVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.List;

@Repository
public class GpuNodeDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertGpuNode(GpuNodeVO gpuNodeVO) {
        return sqlSession.insert("com.xlabeller.sql.gpuNode.insertGpuNode",gpuNodeVO);
    }
	
	public int deleteGpuNode(GpuNodeVO gpuNodeVO) {
        return sqlSession.delete("com.xlabeller.sql.gpuNode.deleteGpuNode",gpuNodeVO);
    }
	
	public List<GpuNodeVO> getGpuNodeList(GpuNodeVO gpuNodeVO) {
        return (List<GpuNodeVO>)sqlSession.selectList("com.xlabeller.sql.gpuNode.getGpuNodeList",gpuNodeVO);
    }
	
	public int updateGpuNode(GpuNodeVO gpuNodeVO) {
        return sqlSession.update("com.xlabeller.sql.gpuNode.updateGpuNode",gpuNodeVO);
    }
 
	public int getGpuNodeTotalCount(GpuNodeVO gpuNodeVO) {
        return (int)sqlSession.selectOne("com.xlabeller.sql.gpuNode.getGpuNodeTotalCount",gpuNodeVO);
    }
	
	public GpuNodeVO getGpuNodeById(GpuNodeVO gpuNodeVO) {
        return (GpuNodeVO)sqlSession.selectOne("com.xlabeller.sql.gpuNode.getGpuNodeById",gpuNodeVO);
    }
	
	
	
	public List<GpuNodeVO> getGpuNodeStatusList(GpuNodeVO gpuNodeVO) {
		List<GpuNodeVO> resultList = (List<GpuNodeVO>)sqlSession.selectList("com.xlabeller.sql.gpuNode.getGpuNodeList",gpuNodeVO);
		
		try {
			for(int i = 0 ; i < resultList.size(); i++) {
				String smiCmd = "sshpass -p '"+resultList.get(i).getPassword()+"' ssh -o StrictHostKeyChecking=no root@"+resultList.get(i).getAddress()+" nvidia-smi";
				String console = cmd(smiCmd);
				System.out.println(console);
				if(console.indexOf("python") != -1) {
					resultList.get(i).setStatus("unavailable");
				}else {
					resultList.get(i).setStatus("available");
				}
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return resultList;
		
		
    }
	
	private String cmd(String command) throws IOException, InterruptedException {
		CmdExector ce = new CmdExector();				
		String[] cmd = {"/bin/bash","-c",command};
		String result = ce.byProcessBuilderRedirect(cmd);
		return result;
	}
	
    
}