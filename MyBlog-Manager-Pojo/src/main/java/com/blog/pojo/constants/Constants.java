package com.blog.pojo.constants;

import java.util.HashMap;
import java.util.Map;

/**
 * 常量类：枚举、
 *
 * Created by yandeguang on 2017/7/17/0017.
 */
public class Constants {

    /**
     * 标记状态
     */
    public enum Status {
        FALSE(1, "未通过"),        //不通过
        PASS(2, "通过");   //通过
        private final Integer value;
        private final String name;

        Status(Integer value, String name) {
            this.value = value;
            this.name = name;
        }

        public Integer getValue() {
            return value;
        }

        public String getName() {
            return name;
        }

        private static final Map<Integer, Status> store = new HashMap<Integer, Status>();

        static {
            Status[] statuses = Status.values();
            for (Status status : statuses) {
                store.put(status.getValue(), status);
            }
        }

        public static Status valueOf(Integer value) {
            return store.get(value);
        }
    }

    /**
     * 登录类型
     */
    public enum Type{
        ADMIN(1, "管理员"),
        USER(2, "用户");
        private final Integer value;
        private final String name;

        Type(Integer value, String name) {
            this.value = value;
            this.name = name;
        }

        public Integer getValue() {
            return value;
        }

        public String getName() {
            return name;
        }

        private static final Map<Integer, Type> store = new HashMap<Integer, Type>();

        static {
            Type[] types = Type.values();
            for (Type type : types) {
                store.put(type.getValue(), type);
            }
        }

        public static Type valueOf(Integer value) {
            return store.get(value);
        }
    }
}
