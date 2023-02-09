package com.xlabeller.visualization;

import com.jcraft.jsch.Session;
import com.xlabeller.common.module.CmdExector;
import com.xlabeller.common.module.Output;
import com.xlabeller.common.module.SessionUtil;
import com.xlabeller.data.DataDao;
import com.xlabeller.gpuNode.GpuNodeDao;
import com.xlabeller.models.*;
import com.xlabeller.sshSession.SessionCmdExecute;
import com.xlabeller.sshSession.SessionSingletone;
import net.lingala.zip4j.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.*;

@Service
public class VisualizationService {
	@Autowired
	VisualizationDao visualizationDao;

	/**
	 * 해상도별 데이터 수량
	 * */
	public Object getDataQuantityPerResolution(VisualizationVO visualizationVO) {
		if(visualizationVO.getDataset_id() == null || "".equals(visualizationVO.getDataset_id())) {
			return Output.JsonOutput("300", "데이터셋ID 파라미터가 전달되지 않았습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}

		Object result = visualizationDao.getDataQuantityPerResolution(visualizationVO);
		return Output.JsonOutput("200", result);
	}

	/**
	 * 클래스별 데이터 수량
	 * */
	public Object getDataQuantityPerClass(VisualizationVO visualizationVO) {
		if(visualizationVO.getDataset_id() == null || "".equals(visualizationVO.getDataset_id())) {
			return Output.JsonOutput("300", "데이터셋ID 파라미터가 전달되지 않았습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}

		Object result = visualizationDao.getDataQuantityPerClass(visualizationVO);
		return Output.JsonOutput("200", result);
	}

	/**
	 * 해상도별 객체 수량
	 * */
	public Object getClassQuantityPerResolution(VisualizationVO visualizationVO) {
		if(visualizationVO.getDataset_id() == null || "".equals(visualizationVO.getDataset_id())) {
			return Output.JsonOutput("300", "데이터셋ID 파라미터가 전달되지 않았습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}

		Object result = visualizationDao.getClassQuantityPerResolution(visualizationVO);
		return Output.JsonOutput("200", result);
	}
}