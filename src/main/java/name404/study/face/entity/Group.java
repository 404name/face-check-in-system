package name404.study.face.entity;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import lombok.Data;
import name404.study.face.hander.FetchHandlerImpl;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ChoiceType;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.Table;

@Erupt(name = "单位及课题组管理")
@Table(name = "user_group")
@Entity
@Data
public class Group extends BaseModel {

        @EruptField(
                views = @View(
                        title = "类别管理"
                ),
                edit = @Edit(
                title = "类别管理",
                type = EditType.CHOICE, search = @Search,
                choiceType = @ChoiceType(
                        fetchHandler = FetchHandlerImpl.class,
                        fetchHandlerParams = {"groupClass"} //该值可被FetchHandlerImpl → fetch方法params参数获取到
                ))
        )
        private Long groupClass;

        @EruptField(
                views = @View(
                        title = "组别名"
                ),
                edit = @Edit(
                        title = "组别名",
                        type = EditType.INPUT, notNull = true,
                        inputType = @InputType
                )
        )
        private String name;

        @EruptField(
                views = @View(
                        title = "组别信息"
                ),
                edit = @Edit(
                        title = "组别信息",
                        type = EditType.INPUT, notNull = true,
                        inputType = @InputType
                )
        )
        private String message;

}