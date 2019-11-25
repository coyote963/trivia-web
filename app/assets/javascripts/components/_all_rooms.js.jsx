class AllRooms extends React.Component {
    constructor(props) {
        super(props);
        this.state = { rooms : undefined }
        this.categoryNames = {
            "any" : "Any Category",
            "9" : "General Knowledge",
            "10" : "Entertainment: Books",
            "11" : "Entertainment: Film",
            "12" : "Entertainment: Music",
            "13" : "Entertainment: Musicals & Theatres",
            "14" : "Entertainment: Television",
            "15" : "Entertainment: Video Games",
            "16" : "Entertainment: Board Games",
            "17" : "Science & Nature",
            "18" : "Science: Computers",
            "19" : "Science: Mathematics",
            "20" : "Mythology",
            "21" : "Sports",
            "22" : "Geography",
            "23" : "History",
            "24" : "Politics",
            "25" : "Art",
            "26" : "Celebrities",
            "27" : "Animals",
            "28" : "Vehicles",
            "29" : "Entertainment: Comics",
            "30" : "Science: Gadgets",
            "31" : "Entertainment: Japanese Anime & Manga",
            "32" : "Entertainment: Cartoon & Animations"
        }
    }
    deleteRoom (roomID) {
        console.log("I deleted " + roomID)
        filterRooms = this.state.rooms.filter((room) => {
            return room.id !== roomID
        })
        this.setState({
            rooms: filterRooms
        })
        
    }
    joinRoom (roomID) {
        console.log("I joined " + roomID)
    }
    componentDidMount () {
        fetch('/rooms.json')
        .then(function (response) {
            return response.json()
        })
        .then(data => {
            this.setState({
                rooms : data
            })
        })
    }
    render () {
        if (this.state.rooms !== undefined) {
            return (
                <div>
                    <h1>Here you will see all the rooms</h1>
                    <table>
                        <tr>
                            <th>Host ID</th>
                            <th>Room Name</th>
                            <th>Question Category</th>
                        </tr>
                        <tbody>
                            { this.state.rooms.map(room => {
                                if (room.host_id == this.props.user.id) {
                                    return <tr>
                                            <td bgcolor="008800">{room.host_id}</td>
                                            
                                            <td>
                                                <a href={"rooms/play/" + room.id + "/1"}>{room.name} </a>
                                            </td>
                                           
                                            <td>{this.categoryNames[room.category]}</td>
                                        </tr>
                                } else {
                                    return <tr>
                                            <td>{room.host_id}</td>
                                            <td>
                                                <a href={"rooms/play/" + room.id + + "/1"}>
                                                    {room.name}
                                                </a>
                                            </td>
                                            <td>{this.categoryNames[room.category]}</td>
                                        </tr>
                                }
                            })}
                        </tbody>
                    </table>
                </div>
            )
        } else {
            return (<h1> Loading... </h1>)
        }
        
    }
}