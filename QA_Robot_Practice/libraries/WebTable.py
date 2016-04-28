from selenium.webdriver.remote.webelement import WebElement

from robot.api import logger
import texttable as tt


class WebTable(WebElement):


    def __init__(self, webelement):

        """
        Constructor for WebTable
        should get WebElement with parent tag <table> as argument
        :param webelement: WebElement which parent tag is TABLE
        """
        super(WebTable, self).__init__(webelement._parent, webelement._id)
        #self.log("Table:")

    def reload(self):
        pass

    def get_body_rows(self):
        """
        Example Table:\n
        +-------------+-----------------+---------+-----------+-------------+
        |      Name   |     Address     |   Zone  |   Status  |Object Count |
        +=============+=================+=========+===========+=============+
        | wos45       | 10.44.35.45     | east    | Active    | 381.4k      |
        +-------------+-----------------+---------+-----------+-------------+
        | wos47       | 10.44.35.47     | west    | Active    | 269k        |
        +-------------+-----------------+---------+-----------+-------------+
        Returns body rows (rows inside TBODY tag) of WebTable as
        [[wos45, 10.44.35.45, east, Active, 381.4k],
        [wos47, 10.44.35.47, west, Active, 269k]]
        where each element is cell WebElement\n
        :return: [[WebElement, WebElement, ...],[WebElement, ...], ...]
        """
        return self._get_rows(self.__get_cells_in_body, "tbody")

    def get_head_rows(self):
        """
        Example Table:\n
        +-------------+-----------------+---------+-----------+-------------+
        |      Name   |     Address     |   Zone  |   Status  |Object Count |
        +=============+=================+=========+===========+=============+
        | wos45       | 10.44.35.45     | east    | Active    | 381.4k      |
        +-------------+-----------------+---------+-----------+-------------+
        | wos47       | 10.44.35.47     | west    | Active    | 269k        |
        +-------------+-----------------+---------+-----------+-------------+
        Returns head rows (rows inside THEAD tag) of WebTable as
        [[Name, Address, Zone , Status , Object Count]]
        where each element is cell WebElement\n
        :return: [[WebElement, WebElement, ...],[WebElement, ...], ...]
        """
        return self._get_rows(self.__get_cells_in_header, "thead")

    def get_foot_rows(self):
        """
        Returns footer rows (rows inside TFOOT tag) of WebTable as
        [[A1, B1, C1], [A2, B2, C2], [A3, B3, C3]]
        where An is cell WebElement
        :return: [[WebElement, WebElement, ...],[WebElement, ...], ...]
        """
        return self._get_rows(self.__get_cells_in_footer, "tfoot")

    def get_rows_by_column_name_value(self, column_name, value,
                                      row_header_index=1):
        """
        Returns body rows (rows inside TBODY tag) of WebTable as
        [[WebElement, WebElement, ...],[WebElement, WebElement, ...], ...]\n
        Example Table:\n
        +-------------+-----------------+---------+-----------+-------------+
        |      Name   |     Address     |   Zone  |   Status  |Object Count |
        +=============+=================+=========+===========+=============+
        | wos45       | 10.44.35.45     | east    | Active    | 381.4k      |
        +-------------+-----------------+---------+-----------+-------------+
        | wos47       | 10.44.35.47     | west    | Active    | 269k        |
        +-------------+-----------------+---------+-----------+-------------+
        If colimn_name = "Status" and value = "Active" than
        method returns [[wos45, 10.44.35.45, east, Active, 381.4k],
        [wos47, 10.44.35.47, west, Active, 269k]]\n
        If colimn_name = "Address" and value = "10.44.35.45" than
        method returns [[wos45, 10.44.35.45, east, Active, 381.4k]]\n
        :param column_name: name of some header cell
        :param value: value of cell in some column
        :param row_header_index: default it is equals 1,
        but if THEAD have more than 1 row, we may use another value
        :return: [[WebElement, WebElement, ...],[WebElement, ...], ...]
        """
        row_indexes = self._get_indexes_of_row_by_column_name_and_value(
            column_name, value,
            row_header_index=row_header_index)
        logger.info(row_indexes)
        result = []
        for index in row_indexes:
            result.append(self.__get_cells_in_body(row_index=index))
        return result

    def get_column_cells_by_column_name(self, column_name, row_header_index=1):
        """
        Example Table:\n
        +-------------+-----------------+---------+-----------+-------------+
        |      Name   |     Address     |   Zone  |   Status  |Object Count |
        +=============+=================+=========+===========+=============+
        | wos45       | 10.44.35.45     | east    | Active    | 381.4k      |
        +-------------+-----------------+---------+-----------+-------------+
        | wos47       | 10.44.35.47     | west    | Active    | 269k        |
        +-------------+-----------------+---------+-----------+-------------+
        If colimn_name = "Status" than
        method returns [Active, Active]\n
        If colimn_name = "Address" than
        method returns [10.44.35.45, 10.44.35.47]\n
        :param column_name: name of some header cell
        :param row_header_index: default it is equals 1,
        but if THEAD have more than 1 row, we may use another value
        :return: [WebElement, WebElement, ...]
        """
        column_index = self._get_index_of_column_by_name(column_name,
                                                         row_header_index)
        return self.get_column_cells_by_column_index(column_index)

    def get_column_cells_by_column_index(self, column_index):
        """
        Example Table:
        +-------------+-----------------+---------+-----------+-------------+
        |      Name   |     Address     |   Zone  |   Status  |Object Count |
        +=============+=================+=========+===========+=============+
        | wos45       | 10.44.35.45     | east    | Active    | 381.4k      |
        +-------------+-----------------+---------+-----------+-------------+
        | wos47       | 10.44.35.47     | west    | Active    | 269k        |
        +-------------+-----------------+---------+-----------+-------------+
        If colimn_index = 4 than
        method returns [Active, Active]
        If colimn_index = 2 than
        method returns [10.44.35.45, 10.44.35.47]
        :param column_index: index of some header cell, starts from 1
        :return: [WebElement, WebElement, ...]
        """
        return self.__get_cells_in_body(column_index=column_index)

    def get_column_cells_by_column_name_and_value(
            self,
            column_name,
            column_value,
            target_column_name,
            row_header_index=1):
        """
         Example Table:
        +-------------+-----------------+---------+-----------+-------------+
        |      Name   |     Address     |   Zone  |   Status  |Object Count |
        +=============+=================+=========+===========+=============+
        | wos45       | 10.44.35.45     | east    | Active    | 381.4k      |
        +-------------+-----------------+---------+-----------+-------------+
        | wos47       | 10.44.35.47     | west    | Active    | 269k        |
        +-------------+-----------------+---------+-----------+-------------+
        If column_name = "Status" and value = "Active"
        and target_column_name = "Name" than
        method returns [wos45, wos47]
        If column_name = "Name" and value = "wos45"
        and target_column_name = "Status" than
        method returns [Active]
        :param column_name: name of some header cell
        :param column_value: value of cell in some column
        :param target_column_name: name of some header cell
        :param row_header_index: default it is equals 1,
        but if THEAD have more than 1 row, we may use another value
        :return: [WebElement, WebElement, ...]
        """
        target_column_index = self._get_index_of_column_by_name(
            target_column_name, row_header_index=row_header_index)
        column_index = self._get_index_of_column_by_name(
            column_name, row_header_index=row_header_index)
        if target_column_index is None or column_index is None:
            return []
        return self.get_column_cells_by_column_index_and_value(
            column_index, column_value, target_column_index)

    def get_column_cells_by_column_index_and_value(
            self, column_index, column_value, target_column_index):
        """
         Example Table:
        +-------------+-----------------+---------+-----------+-------------+
        |      Name   |     Address     |   Zone  |   Status  |Object Count |
        +=============+=================+=========+===========+=============+
        | wos45       | 10.44.35.45     | east    | Active    | 381.4k      |
        +-------------+-----------------+---------+-----------+-------------+
        | wos47       | 10.44.35.47     | west    | Active    | 269k        |
        +-------------+-----------------+---------+-----------+-------------+
        If column_index = 4 and value = "Active"
        and target_column_index = 1 than method returns [wos45, wos47]
        If column_index = 1 and value = "wos45"
        and target_column_index = 4 than method returns [Active]
        :param column_index: index of some header cell, starts from 1
        :param column_value: value of cell in some column
        :param target_column_index: index of some header cell, starts from 1
        :return: [WebElement, WebElement, ...]
        """
        indexes_rows = self._get_indexes_of_row_by_column_index_and_value(
            column_index, column_value)
        result = []
        for i in indexes_rows:
            result.extend(
                self.__get_cells_in_body(column_index=target_column_index,
                                         row_index=i))
        return result

    def _get_rows(self, get_cells_function, table_block_tag_name):
        result = []
        count_rows = len(
            self.find_elements_by_xpath(table_block_tag_name + "/tr"))
        for i in range(count_rows):
            result.append(
                get_cells_function(column_index=None, row_index=i + 1))
        return result

    def __get_cells_in_body(self, column_index=None, row_index=None):
        return self.__get_cells("tbody", "td", column_index=column_index,
                                row_index=row_index)

    def __get_cells_in_header(self, column_index=None, row_index=1):
        return self.__get_cells("thead", "th", column_index=column_index,
                                row_index=row_index)

    def __get_cells_in_footer(self, column_index=None, row_index=1):
        return self.__get_cells("tfoot", "th", column_index=column_index,
                                row_index=row_index)

    def __get_cells(self, t_block_tag, t_cell_tag, column_index=None,
                    row_index=None):
        row_index = '.' if row_index is None else str(row_index)
        column_index = '.' if column_index is None else str(column_index)
        return self.find_elements_by_xpath(
            t_block_tag + "/tr[" + row_index + "]/"
            + t_cell_tag + "[" + column_index + "]")

    def _get_index_of_column_by_name(self, column_name, row_header_index=1):
        head_cells = self.__get_cells_in_header(row_index=row_header_index)
        for index, cell in enumerate(head_cells):
            if cell.text.strip() == column_name:
                return index + 1

    def _get_indexes_of_row_by_column_index_and_value(self, column_index,
                                                      value):
        body_cells = self.__get_cells_in_body(column_index=column_index)
        result = []
        for index, cell in enumerate(body_cells):
            if cell.text.strip() == value:
                result.append(index + 1)
        return result

    def _get_indexes_of_row_by_column_name_and_value(
            self, column_name, value, row_header_index=1):
        column_index = self._get_index_of_column_by_name(
            column_name, row_header_index=row_header_index)
        return self._get_indexes_of_row_by_column_index_and_value(
            column_index, value)

    def _get_table_as_string(self):
        """
        Returns string representation of WebTable. May use in logging
        :return: string
        """
        tab = tt.Texttable()
        list_headrows = self.get_head_rows()
        if len(list_headrows) > 0:
            head_rows = list_headrows[0]
            tab.header([x.text.strip() for x in head_rows])
        list_body_rows = self.get_body_rows()
        for row in list_body_rows:
            tab.add_row([x.text.strip() for x in row])
        tab.set_cols_width([25 for x in list_body_rows[0]])
        return tab.draw()

    def log(self, message):
        try:
            logger.info(message + "\n" + self._get_table_as_string())
        except tt.ArraySizeError:
            logger.info("Cannot display pretty log for table")