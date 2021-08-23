package name404.study.face.entity;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import com.fasterxml.jackson.annotation.JsonFormat;
import name404.study.face.hander.FetchHandlerImpl;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * @author 404name
 */
@Erupt(name = "签到统计",
        power = @Power(importable = true,export = true))
@Table(name = "sign_log")
@Entity
@Data
public class SignLog extends BaseModel {
        public SignLog(){
        }
        public SignLog(User user){
             this.fromUserId = user.getId();
             this.classGroup = user.getClassGroup();
             this.userName = user.getRealName();
             this.classGroup = user.getClassGroup();
             this.userGroup = user.getUserGroup();
             this.unitGroup = user.getUnitGroup();
        }

        @EruptField(
                views = @View(
                        title = "姓名"
                ),
                edit = @Edit(
                        title = "姓名",
                        type = EditType.INPUT, search = @Search, notNull = true,
                        inputType = @InputType
                )
        )
        private String userName;




        @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
        @EruptField(
                views = @View(
                        title = "日期", sortable = true
                ),
                edit = @Edit(
                        title = "日期",
                        type = EditType.DATE, search = @Search(vague = true) , notNull = true,
                        dateType = @DateType
                )
        )
        private Date date;
        @EruptField(
                views = @View(
                        title = "单位"
                ),
                edit = @Edit(
                        title = "单位",
                        type = EditType.CHOICE, search = @Search(vague = true),
                        choiceType = @ChoiceType(
                                fetchHandler = FetchHandlerImpl.class,
                                fetchHandlerParams = {"unitGroup"} //该值可被FetchHandlerImpl → fetch方法params参数获取到
                        ))
        )
        private Long unitGroup;
        @EruptField(
                views = @View(
                        title = "课题组"
                ),
                edit = @Edit(
                        title = "课题组",
                        type = EditType.CHOICE, search = @Search(vague = true),
                        choiceType = @ChoiceType(
                                fetchHandler = FetchHandlerImpl.class,
                                fetchHandlerParams = {"classGroup"} //该值可被FetchHandlerImpl → fetch方法params参数获取到
                        ))
        )
        private Long classGroup;
        @EruptField(
                views = @View(
                        title = "用户类别"
                ),
                edit = @Edit(
                        title = "用户类别",
                        type = EditType.CHOICE, search = @Search(vague = true),
                        choiceType = @ChoiceType(
                                fetchHandler = FetchHandlerImpl.class,
                                fetchHandlerParams = {"userGroup"} //该值可被FetchHandlerImpl → fetch方法params参数获取到
                        ))
        )
        private Long userGroup;
        @EruptField(
                views = @View(
                        title = "停留时间(h)"
                ),
                edit = @Edit(
                        title = "停留时间(h)",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String signTime;

        @EruptField(
                views = @View(
                        title = "进入时间", sortable = true
                ),
                edit = @Edit(
                        title = "进入时间",
                        type = EditType.DATE, notNull = true,
                        dateType = @DateType(type = DateType.Type.TIME)
                )
        )
        private String inTime;

        @EruptField(
                views = @View(
                        title = "离开时间", sortable = true
                ),
                edit = @Edit(
                        title = "离开时间",
                        type = EditType.DATE,
                        dateType = @DateType(type = DateType.Type.TIME)
                )
        )
        private String outTime;

        @EruptField(
                views = @View(
                        title = "事由"
                ),
                edit = @Edit(
                        title = "事由",
                        type = EditType.CHOICE, search = @Search(vague = true),
                        choiceType = @ChoiceType(
                                fetchHandler = FetchHandlerImpl.class,
                                fetchHandlerParams = {"reasonsGroup"} //该值可被FetchHandlerImpl → fetch方法params参数获取到
                        ))
        )
        private Long toDo;

        @EruptField(
                views = @View(
                        title = "备注"
                ),
                edit = @Edit(
                        title = "备注",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String msg;


        @EruptField(
                views = @View(
                        title = "来自用户ID",
                        export = false,
                        show = false
                ),
                edit = @Edit(
                        title = "来自用户ID",
                        type = EditType.NUMBER,
                        numberType = @NumberType
                )
        )
        private Long fromUserId;



}