-- 트리거 원본
-- 입력 트리거
delimiter $$

CREATE TRIGGER trg_AfterInsertBook
 AFTER INSERT ON Book FOR EACH ROW
BEGIN
	INSERT INTO Book_log (bookid_l,	bookname_l,	publisher_l, price_l, dml_type)
	-- new.컬러명 새로 들어온 데이터, old.컬럼명 이전값(UPDATE, DELETE)
	VALUES (NEW.bookid, NEW.bookname, NEW.publisher, NEW.price, 'INSERT');
END;
$$
delimiter $$;
-- ALT + X로 전체 실행

-- 수정 트리거. 수정은 NEW. OLD. 모두 사용가능.
-- OLD만 사용추천
DELIMITER $$

CREATE TRIGGER trg_AfterUpdateBook
AFTER UPDATE ON Book
FOR EACH ROW
BEGIN
    INSERT INTO Book_log
        (bookid_l, bookname_l, publisher_l, price_l, dml_type)
    VALUES
        (OLD.bookid, OLD.bookname, OLD.publisher, OLD.price, 'UPDATE');
END;
$$
DELIMITER $$;

-- 삭제 트리거
DELIMITER $$

CREATE TRIGGER trg_AfterDeleteBook
AFTER DELETE ON Book
FOR EACH ROW
BEGIN
    INSERT INTO Book_log
        (bookid_l, bookname_l, publisher_l, price_l, dml_type)
    VALUES
        (OLD.bookid, OLD.bookname, OLD.publisher, OLD.price, 'DELETE');
END;
$$
DELIMITER $$;
