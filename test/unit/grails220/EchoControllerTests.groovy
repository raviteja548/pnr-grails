package grails220



import org.junit.*
import grails.test.mixin.*

@TestFor(EchoController)
@Mock(Echo)
class EchoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/echo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.echoInstanceList.size() == 0
        assert model.echoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.echoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.echoInstance != null
        assert view == '/echo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/echo/show/1'
        assert controller.flash.message != null
        assert Echo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/echo/list'

        populateValidParams(params)
        def echo = new Echo(params)

        assert echo.save() != null

        params.id = echo.id

        def model = controller.show()

        assert model.echoInstance == echo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/echo/list'

        populateValidParams(params)
        def echo = new Echo(params)

        assert echo.save() != null

        params.id = echo.id

        def model = controller.edit()

        assert model.echoInstance == echo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/echo/list'

        response.reset()

        populateValidParams(params)
        def echo = new Echo(params)

        assert echo.save() != null

        // test invalid parameters in update
        params.id = echo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/echo/edit"
        assert model.echoInstance != null

        echo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/echo/show/$echo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        echo.clearErrors()

        populateValidParams(params)
        params.id = echo.id
        params.version = -1
        controller.update()

        assert view == "/echo/edit"
        assert model.echoInstance != null
        assert model.echoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/echo/list'

        response.reset()

        populateValidParams(params)
        def echo = new Echo(params)

        assert echo.save() != null
        assert Echo.count() == 1

        params.id = echo.id

        controller.delete()

        assert Echo.count() == 0
        assert Echo.get(echo.id) == null
        assert response.redirectedUrl == '/echo/list'
    }
}
