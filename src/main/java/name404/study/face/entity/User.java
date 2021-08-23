package name404.study.face.entity;

import lombok.Data;
import name404.study.face.hander.FetchHandlerImpl;
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
 * 创建权限失效时间
 * 创建单位 / 课题组 / 事由
 */

@Erupt(name = "用户信息",
        power = @Power(importable = true,export = true))
@Table(name = "user")
@Entity
@Data
public class User extends BaseModel {

        @EruptField(
                views = @View(
                        title = "用户姓名"
                ),
                edit = @Edit(
                        title = "用户姓名",
                        type = EditType.INPUT, search = @Search(vague = true)  , notNull = true,
                        inputType = @InputType
                )
        )
        private String realName;
        @EruptField(
                views = @View(
                        title = "类别"
                ),
                edit = @Edit(title = "类别",
                        boolType = @BoolType(trueText = "签到进行中", falseText = "暂无签到"))
        )
        private Boolean signState;
        @EruptField(
                views = @View(
                        export = false,
                        title = "人脸数据"
                ),
                edit = @Edit(title = "人脸信息",
                        boolType = @BoolType(trueText = "已录入", falseText = "未录入"))
        )
        private Boolean status;

        @EruptField(
                views = @View(
                        title = "部门"
                ),
                edit = @Edit(
                        title = "部门",
                        type = EditType.CHOICE, search = @Search(vague = true)  ,
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
                        type = EditType.CHOICE, search = @Search(vague = true)  ,
                        choiceType = @ChoiceType(
                        fetchHandler = FetchHandlerImpl.class,
                        fetchHandlerParams = {"classGroup"} //该值可被FetchHandlerImpl → fetch方法params参数获取到
                ))
        )
        private Long classGroup;
        @EruptField(
                views = @View(
                        title = "用户类型"
                ),
                edit = @Edit(
                        title = "用户类型",
                        type = EditType.CHOICE, search = @Search,
                        choiceType = @ChoiceType(
                                fetchHandler = FetchHandlerImpl.class,
                                fetchHandlerParams = {"userGroup"} //该值可被FetchHandlerImpl → fetch方法params参数获取到
                        ))
        )
        private Long userGroup;
        /*@ManyToOne //多对一
        @EruptField(
                edit = @Edit(title = "多对一表格", type = EditType.REFERENCE_TABLE,
                        referenceTableType = @ReferenceTableType(id = "id", label = "name")
                )
        )
        private Group group; //Table对象定义如下👇*/


        @EruptField(
                views = @View(
                        title = "手机号"
                ),
                edit = @Edit(
                        title = "手机号",
                        type = EditType.NUMBER,
                        numberType = @NumberType
                )
        )
        private Long telphone;

        @EruptField(
                views = @View(
                        title = "邮箱"
                ),
                edit = @Edit(
                        title = "邮箱",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String email;
        @EruptField(
                views = @View(
                        export = false,
                        title = "人脸验证",
                        show = false
                ),
                edit = @Edit(
                        title = "人脸验证",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String faceId;
        /*@EruptField(
                views = @View(
                        title = "状态"
                ),
                edit = @Edit(
                title = "状态",
                type = EditType.CHOICE, search = @Search,
                choiceType = @ChoiceType(
                        fetchHandler = FetchHandlerImpl.class,
                        fetchHandlerParams = {"userStatus"} //该值可被FetchHandlerImpl → fetch方法params参数获取到
                ))
        )*/
        @EruptField(
                views = @View(
                        title = "失效时间"
                ),
                edit = @Edit(
                        title = "失效时间",
                        type = EditType.DATE, notNull = true,
                        dateType = @DateType(type = DateType.Type.DATE_TIME)
                )
        )
        private Date expiredTime;
}