<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/header" flush="false">
    <jsp:param name="cur_page" value="visualization"/>
</jsp:include>
<head>
    <title>밀리터리 이미지넷 객체 라벨기</title>

    <style>
        .ztree .level0 span.button[id$=ico] {
            background: url("images/icon_tree_dataset_selected.png") !important;
        }

        .ztree a.curSelectedNode.level0 span.button[id$=ico] {
            background: url("images/icon_tree_dataset_white.png") !important;
        }

        .ztree .level1 span.button[id$=ico] {
            background: url("images/icon-tree-image.png") !important;
        }

        .ztree a.curSelectedNode.level1 span.button[id$=ico] {
            background: url("images/icon-tree-image-white.png") !important;
        }

        .ztree .level2 span.button[id$=ico] {
            background: url("images/icon_tree_meta_normal.png") !important;
        }

        .ztree a.curSelectedNode.level2 span.button[id$=ico] {
            background: url("images/icon_tree_meta_white.png") !important;
        }

        .ztree .nodata-wrap {
            height: 100%;
        }

        .ztree .nodata-wrap > div {
            margin: 0 auto;
        }

        .ztree .nodata-wrap > div > div {
            color: #777777 !important;
        }

        .ztree .nodata-wrap > div > div:first-of-type {
            margin-top: 10px;
            font-size: 16px !important;
            font-weight: 300;
        }

        .ztree .nodata-wrap > div > div:last-of-type {
            font-weight: 200;
        }

        #workspace #dir_wrap .btn_wrap > div {
            width: 190px;
            margin: 0 auto;
            font-size: 12px;
            color: #ffffff;
            cursor: pointer;
        }

        #workspace #dir_wrap .btn_wrap > div > div:hover {
            background-color: #3A71E9;
        }

        #visualization {
            width: 100%;
            height: calc(100% - 64px);
            position: relative;
        }

        #visualization .title {
            margin: 0 15px 24px;
            font-size: 14px;
            font-weight: 400;
            color: #343434;
            display: inline-block;
        }

        #visualization {
            min-height: calc(100% - 66px);
        }

        #visualization .min_w1440 {
            position: absolute;
            height: 100%;
        }

        #visualization .contents {
            height: 100%;
        }

        #visualization .contents > div {
            height: 100%;
        }

        #visualization .drop_area {
            width: 100%;
        }

        #visualization .drop_area .section {
            display: none;
            height: 100%;
        }

        #visualization .drop_area .section.selected {
            display: block;
        }
        
        #visualization #workspace .loading {
       		position: absolute;
		    width: 100%;
		    height: 100%;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    background-image: url('./images/loader.gif') !important;
		    background-repeat: no-repeat;
		    background-position: center;
		    background-size: 50px 50px;
		    background-color : #d2d2d27a;
        }
        }
    </style>
</head>
<body>
<div class="container" id="visualization">
    <div class="min_w1440">
        <div class="contents">
            <%--            <span class="title">Visualization</span>--%>
            <div class="min_w1440 min_h640">
                <div class="contents flex">
                    <div class="">
                        <jsp:include page="/workspace" flush="false"/>
                    </div>
                    <div class="drop_area">
                        <div class="section main">
                            <jsp:include page="/visualization/main" flush="false"/>
                        </div>
                        <div class="section detail">
                            <jsp:include page="/visualization/detail" flush="false"/>
                        </div>
                    </div>
                    <%--            <div>--%>
                    <%--                <h3>123123</h3>--%>
                    <%--            </div>--%>
                    <%--            <div class="w-100 flex sb">--%>
                    <%--                <div id="chartContainer1" style="height: 370px; width: 30%;">--%>
                    <%--                    <h2>123123</h2>--%>
                    <%--                </div>--%>
                    <%--                <div id="chartContainer2" style="height: 370px; width: 30%;">--%>
                    <%--                    <h2>123123</h2>--%>
                    <%--                </div>--%>
                    <%--            </div>--%>
                </div>
            </div>
        </div>

</body>
<script>

    // 	var gpuArr = [];
    // 	var gpuObj = {};

    $(document).on("sessionLoad", function () {
        if (!loginCheck()) {
            alert("로그인 후 이용 가능합니다");
            location.href = baseUrl + "login";
        } else {
            setting = {
                key: "visualization",
                // create : visualization.event.upload,
                info: [
                    {
                        expandNode: visualization.computed.getDatasetList,
                        drop: {area: "drop_area", onDrop: visualization.event.detail,},
                        rMenu: {"visualization": visualization.event.detail},
                    },
                ],
            };
            //트리 그리기
            workspace(setting);
            visualization.init();
        }
    });
    var visualization = {
        pt: $("#visualization"),
        data: {
            initObj: null
        },
        init: function () {
            const that = this;
            that.event.resetView();
            // that.computed.getDataSizeDistribution();
        },

        event: {
            resetView : function() {
                let that = visualization;
                that.event.main();
            },

            main : function(){
                let that = visualization;
                that.event.hideView();
                that.event.addView($(".main"));
            },

            addView : function(view) {
                view.addClass("selected");
            },

            hideView : function() {
                let that = visualization;
                $("#visualization .section").each(function() {
                    $(this).removeClass("selected");
                });
            },

            detail: function () {
                const that = visualization;
                let selected_nodes = wsObj[setting.key].dir.getSelectedNodes();
                if (selected_nodes.length != 1) {
                    alert("한 개의 Dataset만 선택해주세요");
                    return false;
                }

                let detail_id = wsObj[setting.key].dir.getSelectedNodes()[0].id;
                let title = wsObj[setting.key].dir.getSelectedNodes()[0].title;
                
                // console.log("title / datasetId : ", title, detail_id);

                that.event.hideView();
                that.event.addView($(".detail"));
                visualizationDetail.init(title, detail_id);
                // var data_modified = that.dataModifiedCheck();        // jh.sa 210129
                // if (data_modified) {
                //     that.getDatasetById("labelling");
                // }
            },
        },

        computed: {
            // 데이터셋 리스트 url호출
            getDatasetList: function () {
                var that = visualization;

                var url = "getDatasetList";
                var ajaxData = {};
                var pNode = wsObj[setting.key].dir.getSelectedNodes()[0];
                // console.log("pNode::", pNode);
                $("#loader").show();
                that.computed.getList(url, ajaxData, pNode);
            },

            //
            getList: function (url, ajaxData, parentNode) {
                var that = visualization;

                //console.log("parentNode::", parentNode);
                //로딩처리 시작
                if (parentNode != null) {
                    parentNode.icon = baseUrl + "css/img/loading.gif";
                    wsObj[setting.key].dir.updateNode(parentNode);
                }

                console.log("url : " + url);

                $.ajax({
                    url: baseUrl + "data/" + url + ".json",
                    data: ajaxData,
                    success: function (res) {

                        // console.log("=====getDataList=====", res)
                        // console.log("==========res=========");
                        if (res.result.code == "200") {
                            if (res.datasetVO != undefined) {
                                that.render.setDataSetJson(res);
                            } else if (res.dataVO != undefined) {
                                that.render.setDataJson(res, parentNode);
                            }
                        } else if (res.result.code == "2001") {
                            alert(res.result.data);
                            location.href = baseUrl + 'login';
                        } else {
                            alert(res.result.data);
                        }

                        $("#loader").hide();
                        //로딩처리 끝
                        console.log("parentNode", parentNode);
                        if (parentNode != null) {
                            console.log("1233");
                            parentNode.icon = "";
                            wsObj[setting.key].dir.updateNode(parentNode);
                        }
                    },
                    error: function (err) {
                        console.log("ERROR!!", err);
                    },
                });
            },
        },

        render: {
            setDataSetJson: function (res) {
                var that = visualization;
                console.log("res : ", res);
// 			res.result.data.length = 0;
                if (res.result.data.length > 0) {
                    var config = new Array();
                    $.each(res.result.data, function (index, value) {
                        let node_name = value.title;
                        if (value.title.length > 10) {
                            node_name = node_name.substring(0, 10) + "...";
                        }
                        var obj = new Object();
                        obj.id = value.dataset_id;
                        obj.pId = null;
                        obj.name = node_name;
                        obj.title = value.title;
                        obj.contents = value.contents;
                        obj.created_date = value.created_data;
                        obj.status = value.status;

                        //자식노드 있을시 isParent = true
                        obj.isParent = true;
                        obj.nodeMove = false;

                        config.push(obj);
                    });
                    wsObj[setting.key].addNode(null, config);
                } else {
                    that.render.nodata();
                }
            },
            // dataset이 없을때
            nodata: function () {
                var that = visualization;

                var html = "<div class='nodata-wrap flex'><div><img class='' src='<c:url value='/images/icon_nodata_dataset.png' />'><div>데이터가 없습니다.set</div><div>Please add dataset.</div></div></div>"
                that.pt.find(".ztree").append(html);
            },
        },
    };
</script>
