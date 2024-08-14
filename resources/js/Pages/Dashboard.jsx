import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, useForm } from '@inertiajs/react';
import background from '../../../public/images/mainBackground.jpg';
import { useState, useEffect } from 'react';
import TextInput from '@/Components/TextInput';
import OpenAI from 'openai'
import { Textarea } from '@headlessui/react';
import PrimaryButton from '@/Components/PrimaryButton';
import axios from 'axios';

const openai = new OpenAI({
    apiKey: import.meta.env.VITE_OPENAI_API_KEY,
    dangerouslyAllowBrowser: true //Nanti dihilangkan
});

export default function Dashboard({ auth, user }) {
    const [isVisible, setIsVisible] = useState(true);
    const { data, setData, post, processing, errors, reset } = useForm({
        input: "",
        output: "",
        selectedConversation: 0,
        prevMsg: []
    });

    const handleSubmit = async (e) => {
        getPrevMsg();
        try {
            const response = await openai.chat.completions.create({
                model: 'gpt-4o-mini',
                messages: [
                    {
                        "role": "user",
                        "content": data.prevMsg + data.input
                    },
                ]
            });

            post(route('message.store', {'role': 'assistant', 'input': response.choices[0].message.content, 'user_id': auth.user.id}), {
                onFinish: () =>  {data.output = "", displayMessage(data.selectedConversation)}
            });
        } catch (error) {
            console.error("Failed to fetch the completion: ", error);
        }
    }

    const submitConversation = (e) => {
        e.preventDefault();
        post(route('conversation.store'), {
            onFinish: () =>  setIsVisible(false),
        });
    }

    const submitMessage = (e) => {
        e.preventDefault();
        handleSubmit();
        post(route('message.store', {'role': 'user', 'user_id': auth.user.id}), {
            onFinish: () =>  {data.input = "", displayMessage(data.selectedConversation)}
        });
    }

    const displayMessage = (id) => {
        setIsVisible(false)

        axios.get(`/conversation/${id}`)
                .then(response => {
                    setData('selectedConversation', id);
                    setMessages(response.data);
                })
                .catch(error => {
                    console.error("There was an error fetching the conversations!", error);
                });
    }

    const getPrevMsg = () => {
        const fileUrl = `/storage/user_conversation/Conversation${data.selectedConversation}${auth.user.id}.json`;

        fetch(fileUrl)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(json => setData('prevMsg', json))
            .catch(error => console.error('Error fetching the JSON file:', error));
    }

    const [conversations, setConversations] = useState([]);
    const [messages, setMessages] = useState([]);

    useEffect(() => {
        axios.get('/conversation')
            .then(response => {
                setConversations(response.data);
            })
            .catch(error => {
                console.error("There was an error fetching the conversations!", error);
            });
    }, []);

    return (
        <AuthenticatedLayout
            user={auth.user}
        >
            <Head title="Dashboard" />
            <div className="flex flex-col w-screen h-screen bg-cover bg-center bg-primary">
                <div className="mx-14 p-4 relative mt-24 h-full">
                    <div className="grid grid-cols-3 ">
                        <div className="col-span-6 grid grid-cols-7 grid-rows-1 gap-4 h-128">
                            <div className="col-span-2 row-span-1 p-4 border border-white mr-14 rounded-lg shadow text-white flex flex-col overflow-y-auto">
                                Isinya nanti history conversation.
                                <ul className=''>
                                    {conversations.map(conversation => (
                                        <li key={conversation.id} className="text-text mb-2">
                                            <div >
                                                <button className="bg-accent w-56 px-6 py-2 rounded-lg hover:bg-darker" onClick={() => displayMessage(conversation.id)}>
                                                    {conversation.title}
                                                </button>
                                            </div>
                                        </li>
                                    ))}
                                </ul>
                            </div>
                            <div className="col-span-5 row-span-1 p-4 rounded-lg shadow max-h-screen">
                                <div className="flex max-w-7xl mx-auto items-center justify-items-end flex-col">
                                        <form onSubmit={submitConversation}>
                                            {isVisible && <h1 className="text-5xl font-bold text-white mb-6">Ask Me Anything</h1>}

                                            {isVisible &&
                                            <button
                                                className="bg-blue-500 text-white px-8 py-4 rounded-full text-md hover:bg-blue-900 transition"
                                                 type='submit'> New Conversation </button>}
                                        </form>
                                    </div>
                                    {!isVisible && <div className="flex overflow-y-auto -z-0 h-full max-h-128">
                                        <div className="flex-1 ">
                                            <div className="flex mt-4 mr-2 justify-start">
                                                <div key={'default'} className="bg-emerald-300 rounded-lg px-6 py-3 text-black w-fit ">
                                                    Hello! How can i help you today?
                                                </div>
                                            </div>

                                            {Array.isArray(messages) && messages.map((message) => (
                                                message.sender === "user" ? (
                                                    <div key={message.id} className="flex mt-4 mr-2 justify-end h-auto">
                                                        <div className="bg-cyan-300 rounded-lg px-6 py-3 text-black w-fit max-w-3xl h-fit break-words" autoComplete="input">
                                                            {message.message_text}
                                                        </div>
                                                    </div>
                                                ) : (
                                                    <div key={message.id} className="flex mt-4 mr-2 justify-start h-auto">
                                                        <div className="bg-emerald-300 rounded-lg px-6 py-3 text-black w-fit h-fit break-words" autoComplete="input">
                                                            {message.message_text}
                                                        </div>
                                                    </div>
                                                )
                                            ))}

                                            {data.input ? (
                                                <div className="flex mt-4 mr-2 justify-end h-auto">
                                                    <div className="bg-cyan-300 rounded-lg px-6 py-3 text-black w-fit max-w-3xl h-fit break-words" autoComplete="input">
                                                        {data.input}
                                                    </div>
                                                </div>
                                            ) : null}
                                        </div>
                                    </div>}
                            </div>

                        </div>
                    </div>
                    <div className="p-4 rounded-lg shadow mt-6 max-w-full">
                                {!isVisible && <form onSubmit={submitMessage} className='justify-center items-center flex relative '>
                                        <textarea
                                            id="input"
                                            name='input'
                                            value={data.input}
                                            onChange={(e) => setData('input', e.target.value)}
                                            className="w-full mt-1 bg-transparent text-cyan-50 pr-12 break-words h-auto border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm"
                                            autoComplete="new-input"
                                            rows="3"
                                            placeholder="Allow me to help you"
                                            required
                                        />

                                        <textarea
                                            id="conversation_id"
                                            name='conversation_id'
                                            value={data.selectedConversation}
                                            className="w-full mt-1 bg-transparent text-cyan-50 pr-12 break-words h-auto border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm"
                                            autoComplete="new-input"
                                            rows="1"
                                            hidden
                                            placeholder="Allow me to help you"
                                            required
                                        />

                                        <div className="flex justify-end">
                                            <button className=' h-full text-light items-center pr-11' type='submit'>
                                                Ask
                                            </button>
                                        </div>
                                </form>}
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
