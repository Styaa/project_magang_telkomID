import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, useForm } from '@inertiajs/react';
import background from '../../../public/images/mainBackground.jpg';
import { useState } from 'react';
import TextInput from '@/Components/TextInput';
import OpenAI from 'openai'
import { Textarea } from '@headlessui/react';

const openai = new OpenAI({
    apiKey: import.meta.env.VITE_OPENAI_API_KEY,
    dangerouslyAllowBrowser: true //Nanti dihilangkan
});

export default function Dashboard({ auth }) {
    const [isVisible, setIsVisible] = useState(true);
    // const { data, setData, post, processing, errors, reset } = useForm({
    //     input: '',
    //     output: '',
    // });

    const [input, setInput] = useState("");
    const [output, setOutput] = useState("");

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await openai.chat.completions.create({
                model: 'gpt-3.5-turbo',
                messages: [
                    {
                        "role": "assistant",
                        "content": "HALO BANG JAGO"
                    },
                    {
                        "role": "user",
                        "content": "hi"
                    }
                ]
            });
            console.log(response.choices[0].message.content);
            setOutput(response.choices[0].message.content)
        } catch (error) {
            console.error("Failed to fetch the completion: ", error);
            // Optionally update the state to show an error message to the user
        }
    }

    return (
        <AuthenticatedLayout
            user={auth.user}
        >
            <Head title="Dashboard" />
            <div className="flex flex-col w-screen h-screen bg-cover bg-center bg-slate-600">
                <div className="mx-14 p-4 relative mt-24 h-full">
                    <div className="grid grid-cols-3 ">
                        <div className="col-span-6 grid grid-cols-7 grid-rows-1 gap-4 h-128">
                            <div className="col-span-2 row-span-1 p-4 border border-green-600 rounded-lg shadow ">
                                <TextInput>

                                </TextInput>
                            </div>
                            <div className="col-span-5 row-span-1 p-4 border border-blue-600 rounded-lg shadow max-h-screen">
                                <div className="flex max-w-7xl mx-auto items-center justify-items-end flex-col">
                                        {isVisible && <h1 className="text-5xl font-bold text-white mb-6">Ask Me Anything</h1>}

                                        {isVisible &&
                                        <button
                                            className="bg-blue-500 text-white px-8 py-4 rounded-full text-md hover:bg-blue-900 transition"
                                            onClick={() => setIsVisible(false)} > Get Started </button>}
                                    </div>
                                    {!isVisible && <div className="flex overflow-y-auto -z-0 h-full max-h-128">
                                        <div className="flex-1 ">
                                            <div className="flex mt-4 mr-2 justify-start">
                                                <div className="bg-emerald-300 rounded-lg px-6 py-3 text-black w-fit ">
                                                    Hello! How can i help you today?
                                                </div>
                                            </div>

                                            {input ? (
                                                <div className="flex mt-4 mr-2 justify-end h-auto">
                                                    <div className="bg-cyan-300 rounded-lg px-6 py-3 text-black w-fit max-w-3xl h-fit break-words" autoComplete="input">
                                                        {input}
                                                    </div>
                                                </div>
                                            ) : null}

                                            {output ? (
                                                <div className="flex mt-4 mr-2 justify-start h-auto">
                                                    <div className="bg-emerald-300 rounded-lg px-6 py-3 text-black w-fit h-fit break-words" autoComplete="input">
                                                        {output}
                                                    </div>
                                                </div>
                                            ) : null}

                                        </div>
                                    </div>}
                            </div>

                        </div>
                    </div>
                    <div className="p-4 border border-red-600 rounded-lg shadow mt-6 max-w-full">
                                {!isVisible && <form onSubmit={handleSubmit} className='justify-center items-center flex relative '>
                                        <Textarea
                                            id="input"
                                            value={input}
                                            onChange={(e) => setInput(e.target.value)}
                                            type="text"
                                            className="w-full mt-1 bg-transparent text-cyan-50 pr-12 break-words h-auto border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm"
                                            autoComplete="new-input"
                                            rows="3"
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
